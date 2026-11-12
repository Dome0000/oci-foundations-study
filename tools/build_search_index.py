#!/usr/bin/env python3
"""สร้าง assets/js/search-index.js จากไฟล์ HTML ทั้งหมดในโปรเจกต์
ดึง <title>, <h1>, <h2 id=...> และ meta description — ออกเป็น JSON-in-JS (window.SEARCH_INDEX)
ใช้งาน: python tools/build_search_index.py
"""
import json
import os
import re
import html
from html.parser import HTMLParser

BASE = r"C:\Users\Windows\Downloads\cheatsheet\oci-foundations-study"
OUT = os.path.join(BASE, "assets", "js", "search-index.js")

class PageParser(HTMLParser):
    def __init__(self):
        super().__init__(convert_charrefs=True)
        self.title = ""
        self.h1 = ""
        self.meta_description = ""
        self.h2 = []  # list of (id, text)
        self._stack = []
        self._capture = None
        self._buf = []

    def handle_starttag(self, tag, attrs):
        attrs = dict(attrs)
        if tag == "title":
            self._capture = "title"; self._buf = []
        elif tag == "h1":
            self._capture = "h1"; self._buf = []
        elif tag == "h2" and attrs.get("id"):
            self._capture = ("h2", attrs["id"]); self._buf = []
        elif tag == "meta" and (attrs.get("name") or "").lower() == "description":
            self.meta_description = attrs.get("content", "")

    def handle_endtag(self, tag):
        if (self._capture == "title" and tag == "title") or (self._capture == "h1" and tag == "h1"):
            text = " ".join("".join(self._buf).split())
            if self._capture == "title":
                self.title = text
            else:
                self.h1 = text
            self._capture = None
        elif isinstance(self._capture, tuple) and self._capture[0] == "h2" and tag == "h2":
            text = " ".join("".join(self._buf).split())
            self.h2.append((self._capture[1], text))
            self._capture = None

    def handle_data(self, data):
        if self._capture:
            self._buf.append(data)

def main():
    entries = []
    for name in sorted(os.listdir(BASE)):
        if not name.endswith(".html"):
            continue
        path = os.path.join(BASE, name)
        parser = PageParser()
        with open(path, encoding="utf-8") as f:
            parser.feed(f.read())
        page_title = parser.h1 or parser.title or name
        excerpt = (parser.meta_description or "").strip()[:140]
        section = name.replace(".html", "")
        # main page entry
        entries.append({
            "title": page_title,
            "url": name,
            "section": section,
            "tags": f"{parser.title} {page_title} {excerpt}",
            "excerpt": excerpt,
        })
        # section entries (h2 anchors)
        for h2_id, h2_text in parser.h2:
            if not h2_text:
                continue
            entries.append({
                "title": h2_text,
                "url": f"{name}#{h2_id}",
                "section": page_title[:60],
                "tags": f"{h2_text} {page_title} {excerpt}",
                "excerpt": excerpt,
            })
    with open(OUT, "w", encoding="utf-8") as f:
        f.write("/* \u0e2a\u0e23\u0e49\u0e32\u0e07\u0e42\u0e14\u0e22 tools/build_search_index.py — \u0e2d\u0e22\u0e48\u0e32\u0e41\u0e01\u0e49\u0e14\u0e49\u0e27\u0e22\u0e21\u0e37\u0e2d */\n")
        f.write("window.SEARCH_INDEX = ")
        f.write(json.dumps(entries, ensure_ascii=False, indent=1))
        f.write(";\n")
    print(f"wrote {len(entries)} entries to {OUT}")

if __name__ == "__main__":
    main()
