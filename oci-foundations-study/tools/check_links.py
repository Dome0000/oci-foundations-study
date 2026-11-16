#!/usr/bin/env python3
"""ตรวจลิงก์ภายในทั้งหมดในไฟล์ HTML: href/src ที่อ้างไฟล์ในโปรเจกต์ต้องมีอยู่จริง
- ลิงก์ http(s), mailto, tel, #, javascript: ข้าม
- ตรวจไม่มี request ออกอินเทอร์เน็ตโดยสแกน src= ที่ไม่ใช่ local (เตือนถ้าเจอ)
"""
import os
import re
import sys
import urllib.parse

BASE = r"C:\Users\Windows\Downloads\cheatsheet\oci-foundations-study"
ATTR = re.compile(r'(?:href|src)\s*=\s*"([^"]+)"', re.I)

def main():
    problems = []
    external_src = []
    for name in sorted(os.listdir(BASE)):
        if not name.endswith(".html"):
            continue
        path = os.path.join(BASE, name)
        with open(path, encoding="utf-8") as f:
            content = f.read()
        for m in ATTR.finditer(content):
            link = m.group(1).strip()
            low = link.lower()
            if low.startswith(("http://", "https://", "mailto:", "tel:", "javascript:", "data:")):
                if low.startswith(("http://", "https://")) and name != "" and link.startswith("http") and "docs.oracle.com" not in link and "oracle.com" not in link and "STATUS" not in link:
                    pass  # external links allowed (they just must not be required to load)
                continue
            if link.startswith("#"):
                anchor = link[1:]
                if anchor and f'id="{anchor}"' not in content and f"id='{anchor}'" not in content:
                    problems.append(f"{name}: anchor #{anchor} not found in page")
                continue
            target = link.split("#", 1)[0]
            target_path = os.path.join(BASE, urllib.parse.unquote(target))
            if not os.path.exists(target_path):
                problems.append(f"{name}: missing local file -> {link}")
    # check for external src= (would violate no-network rule)
    for name in sorted(os.listdir(BASE)):
        if not name.endswith(".html"):
            continue
        with open(os.path.join(BASE, name), encoding="utf-8") as f:
            content = f.read()
        for m in re.finditer(r'src\s*=\s*"([^"]+)"', content, re.I):
            src = m.group(1).strip().lower()
            if src.startswith(("http://", "https://", "//")):
                external_src.append(f"{name}: external src -> {src}")
    if external_src:
        for e in external_src:
            problems.append("EXTERNAL SRC (violates file:// rule): " + e)
    if problems:
        for p in problems:
            print("FAIL:", p)
        print(f"\n{len(problems)} problem(s).")
        sys.exit(1)
    print("All internal links OK; no external <script/img> sources.")

if __name__ == "__main__":
    main()
