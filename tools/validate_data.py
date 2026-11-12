#!/usr/bin/env python3
"""ตรวจข้อมูลของเว็บ OCI Foundations Study:
- quiz-data.js / flashcard-data.js / glossary-data.js parse และ schema ถูกต้อง
- id ไม่ซ้ำ, answer อยู่ในช่วง options, single = คำตอบเดียว, multi = >= 2
- ทุกข้อมี question/options/explanation/wrongWhy/refLink
- สัดส่วนโดเมนใกล้ target 22/75/38/15 (คลาดเคลื่อนไม่เกิน 10%%)
- flashcards: id ไม่ซ้ำ, front/back ไม่ว่าง, domain ถูกต้อง, จำนวน >= 200
- quiz: จำนวน >= 150

ข้อมูลเก็บเป็น JS object literal (key ไม่ quote) — สคริปต์นี้แปลงเป็น JSON แบบอนุรักษ์:
ลบ /* */ comments, quote unquoted keys, แล้ว json.loads
"""
import json
import re
import sys
import math

BASE = r"C:\Users\Windows\Downloads\cheatsheet\oci-foundations-study"

def load_js_array(path, var_name):
    with open(path, encoding="utf-8") as f:
        s = f.read()
    m = re.search(re.escape(var_name) + r"\s*=\s*\[", s)
    if not m:
        raise ValueError(f"{var_name} = [...] not found in {path}")
    body = s[m.start() + len(var_name):]
    start = body.index("[")
    # find matching closing bracket
    depth = 0
    instr = False
    escape = False
    for i, ch in enumerate(body[start:], start):
        if escape:
            escape = False
            continue
        if ch == "\\" and instr:
            escape = True
            continue
        if ch == '"':
            instr = not instr
            continue
        if instr:
            continue
        if ch == "[":
            depth += 1
        elif ch == "]":
            depth -= 1
            if depth == 0:
                body = body[start:i + 1]
                break
    # strip /* */ comments
    body = re.sub(r"/\*.*?\*/", "", body, flags=re.S)
    # quote unquoted keys (conservative: only keys right after { or ,)
    body = re.sub(r'([{,]\s*)([A-Za-z_][A-Za-z0-9_]*)\s*:', lambda m: m.group(1) + '"' + m.group(2) + '":', body)
    # remove trailing commas before } or ]
    body = re.sub(r",(\s*[}\]])", r"\1", body)
    return json.loads(body)

def fail(msgs):
    for m in msgs:
        print("FAIL:", m)
    print(f"\n{len(msgs)} problem(s) found.")
    sys.exit(1)

def main():
    problems = []

    # ---------- quiz ----------
    quiz = load_js_array(BASE + r"\assets\js\quiz-data.js", "window.QUIZ_DATA")
    print(f"quiz questions: {len(quiz)}")
    if len(quiz) < 150:
        problems.append(f"quiz has {len(quiz)} questions (< 150)")

    ids = [q["id"] for q in quiz]
    if len(set(ids)) != len(ids):
        dup = {i for i in ids if ids.count(i) > 1}
        problems.append(f"duplicate quiz ids: {sorted(dup)}")

    domain_count = {"1": 0, "2": 0, "3": 0, "4": 0}
    difficulty_count = {"recall": 0, "understand": 0, "scenario": 0}
    for q in quiz:
        qid = q.get("id", "?")
        for field in ("question", "explanation", "wrongWhy", "refLink"):
            if not str(q.get(field, "")).strip():
                problems.append(f"{qid}: missing {field}")
        if not q.get("refLink", "").startswith("https://"):
            problems.append(f"{qid}: refLink not https")
        opts = q.get("options")
        ans = q.get("answer")
        if not isinstance(opts, list) or len(opts) < 2:
            problems.append(f"{qid}: needs >= 2 options")
            continue
        if not isinstance(ans, list) or not ans:
            problems.append(f"{qid}: answer must be a non-empty list")
            continue
        for a in ans:
            if not isinstance(a, int) or a < 0 or a >= len(opts):
                problems.append(f"{qid}: answer index {a} out of range")
        if q.get("type") == "single" and len(ans) != 1:
            problems.append(f"{qid}: type=single but {len(ans)} answers")
        if q.get("type") == "multi" and len(ans) < 2:
            problems.append(f"{qid}: type=multi but {len(ans)} answer(s)")
        if q.get("type") not in ("single", "multi"):
            problems.append(f"{qid}: unknown type {q.get('type')}")
        d = q.get("domain")
        if d not in domain_count:
            problems.append(f"{qid}: unknown domain {d}")
        else:
            domain_count[d] += 1
        diff = q.get("difficulty")
        if diff not in difficulty_count:
            problems.append(f"{qid}: unknown difficulty {diff}")
        else:
            difficulty_count[diff] += 1

    targets = {"1": 22, "2": 75, "3": 38, "4": 15}
    total = sum(domain_count.values())
    for d, target in targets.items():
        actual = domain_count[d]
        if abs(actual - target) > max(2, math.ceil(target * 0.10)):
            problems.append(f"domain {d}: {actual} questions vs target {target} (>10% off)")
    print("domain distribution:", domain_count)
    print("difficulty distribution:", difficulty_count)

    # ---------- flashcards ----------
    fc_path = BASE + r"\assets\js\flashcard-data.js"
    try:
        fc = load_js_array(fc_path, "window.FLASHCARD_DATA")
    except Exception as e:
        problems.append(f"cannot parse flashcard-data.js: {e}")
        fc = []
    if fc:
        print(f"flashcards: {len(fc)}")
        if len(fc) < 200:
            problems.append(f"flashcards has {len(fc)} cards (< 200)")
        fids = [c["id"] for c in fc]
        if len(set(fids)) != len(fids):
            problems.append("duplicate flashcard ids")
        for c in fc:
            if not str(c.get("front", "")).strip() or not str(c.get("back", "")).strip():
                problems.append(f"{c.get('id', '?')}: empty front/back")
            if c.get("domain") not in ("1", "2", "3", "4"):
                problems.append(f"{c.get('id', '?')}: bad domain")

    # ---------- glossary ----------
    gloss = load_js_array(BASE + r"\assets\js\glossary-data.js", "window.GLOSSARY_DATA")
    print(f"glossary terms: {len(gloss)}")
    for g in gloss:
        if not str(g.get("term", "")).strip() or not str(g.get("def", "")).strip():
            problems.append(f"glossary entry missing term/def: {g}")

    if problems:
        fail(problems)
    print("\nAll data checks passed.")

if __name__ == "__main__":
    main()
