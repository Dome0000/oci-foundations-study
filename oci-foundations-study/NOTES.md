# NOTES.md — สิ่งที่ต้องให้ผู้ใช้ตรวจสอบ / ความไม่แน่นอน

## 1) ข้อมูลข้อสอบ 1Z0-1085-26 — **ไม่ได้รับการยืนยันจาก Oracle University**
- สภาพแวดล้อมที่สร้างเว็บนี้เข้าหน้าข้อสอบทางการไม่ได้เลย (education.oracle.com timeout, oracle.com 403, certify/certification.oracle.com DNS ไม่ resolve, WebSearch 403, search engine ติด captcha, mylearn เป็น JS shell)
- ตามกฎใน PROMPT.md §1 ("ถ้าเข้าเว็บไม่ได้ ให้ใช้ข้อมูลด้านบนและแสดงแบนเนอร์") เว็บนี้จึงใช้ตัวเลขจาก prompt: **40 ข้อ / 60 นาที / ผ่าน 65% / โดเมน 1–4 น้ำหนัก 15/50/25/10 / รหัส 1Z0-1085-26 ใช้ตั้งแต่ มิ.ย. 2026 แทน 1Z0-1085-25 / ข้อสอบภาษาอังกฤษ**
- **แบนเนอร์เตือนในหน้า index.html** บอกให้ "ตรวจสอบรายละเอียดข้อสอบกับหน้าทางการของ Oracle ก่อนสอบ" และทุกหน้าเกี่ยวกับ repo นี้ (d4) ติดป้าย "ตรวจสอบก่อนสอบ"
- สิ่งที่ผู้ใช้ต้องตรวจเองกับ Oracle University / Pearson VUE registration: จำนวนข้อจริง, เวลา, คะแนนผ่าน, รายชื่อ objectives ทางการ (โดยเฉพาะว่า database อยู่ใน scope หรือไม่), รูปแบบข้อสอบ (single/multi-select), วันที่ 1Z0-1085-25 ถูกยกเลิก
- ถ้า objectives ทางการต่างจากด้านบน PROMPT.md ให้ "หยุดและสรุปให้ผู้ใช้ก่อนทำต่อ" — เว็บนี้สร้างจากสมมติฐานด้านบนเท่านั้น

## 2) หัวข้อ Database — ติดป้าย "เสริม"
- PROMPT.md ระบุให้ตรวจว่า database อยู่ใน objectives ปัจจุบันหรือไม่ ถ้าไม่ให้ทำเป็น "รู้จักไว้" — เมื่อยืนยัน objectives ทางการไม่ได้ เว็บนี้จึงทำเป็นส่วน "เสริม (นอกขอบเขตสอบ)" ในหน้า 2.3 แบบสั้น ๆ เท่านั้น
- รายชื่อบริการที่ยกมา: Autonomous Database (ATP/ADW), Base Database Service, Exadata Database Service, MySQL HeatWave, NoSQL Database, Oracle AI Database@Azure/@AWS/@Google Cloud — ทั้งหมดเป็นข้อมูลจริงจาก docs.oracle.com ของ Oracle

## 3) ตัวเลขและขีดจำกัดที่ "อาจเปลี่ยนได้" — ไม่ฝังตัวเลขในเนื้อหา
- โควตา Always Free (จำนวน VM/core/storage), มูลค่า trial credit (ปกติ 30 วัน) — ห้ามฝัง ลิงก์ไปหน้า free tier + ป้าย "ตรวจสอบก่อนสอบ" เสมอ
- % uptime ของ SLA ต่อบริการ — ไม่ฝังตัวเลข; ลิงก์หน้า SLA
- ราคาทุกชนิด — ไม่ฝัง; Cost Estimator สาธารณะ
- limits ของบริการ (จำนวน VCN ต่อ region, จำนวน object ฯลฯ) — ระบุเฉพาะค่าที่ docs ระบุชัดและจำเป็น (เช่น VCN /16–/30, FD = 3) ส่วนอื่นเขียน "ตรวจสอบกับเอกสารทางการ"
- multi-AD region 5 แห่ง (Phoenix, Ashburn, Chicago, London, Frankfurt) — ยืนยันจาก regions.htm ณ วันที่สร้าง; Oracle อาจเพิ่ม region ใหม่ที่มีหลาย AD ได้
- home region — เอกสารที่เข้าถึงได้จาก sandbox นี้ไม่ได้นิยามค่า home region; ใส่ป้าย [ตรวจสอบกับเอกสารทางการ] ไว้แล้วในหน้า D1

## 4) ชื่อผลิตภัณฑ์ที่เพิ่งเปลี่ยนชื่อ
- "Oracle Database@Azure/@AWS/@Google Cloud" → ปัจจุบัน docs.oracle.com ใช้ **"Oracle AI Database@Azure / @AWS / @Google Cloud"** (รีแบรนด์ Oracle AI Database) — เนื้อหาใช้ชื่อใหม่ + วงเล็บชื่อเดิมตามกฎของ prompt
- IAM "with identity domains" เป็นรุ่นปัจจุบัน; "IAM without identity domains" (รุ่นเก่า) ยังมี docs แยก แต่เว็บนี้สอนเฉพาะรุ่นใหม่

## 5) ข้อควรระวังเรื่องความถูกต้อง
- ข้อสอบ 150 ข้อและ flashcards 200 ใบ **เขียนขึ้นใหม่ทั้งหมดจากความเข้าใจ docs.oracle.com** — ไม่ได้ดัดแปลงจากข้อสอบจริง/dumps/เว็บ braindump ใด ๆ
- เนื้อหาทุกหน้าเรียบเรียงใหม่ ไม่ได้คัดลอกวรรคยาวจากเอกสาร
- บางจุดอาจอ้างอิงบริการ/ชื่อ resource-types ที่เปลี่ยนแปลงได้ (เช่น resource-type ใน policy) — ฝั่ง docs มี policyreference.htm เป็นแหล่งตรวจสอบฉบับปัจจุบันเสมอ

## 6) หมายเหตุทางเทคนิค (การสร้างเว็บนี้)
- tools/ เขียนด้วย **Python 3.12 stdlib** (ไม่ใช่ Node — เครื่องสร้างเว็บนี้ไม่มี Node) — PROMPT.md ไม่ได้กำหนดภาษาของ tools ไว้ จึงเลือก Python
- Leitner boxes ของ flashcards เก็บใน localStorage key `oci-study-leitner-v1` (แยกจาก progress key `oci-study-progress-v1`)
- ข้อที่ตอบผิดจาก quiz เก็บใน localStorage key `oci-study-wrong-ids` เพื่อโหมดทบทวนข้อผิด
- ไม่มีการใช้ ES modules / fetch / CDN / ฟอนต์ภายนอก — ทุกหน้าทำงานบน file:// ได้
- search-index.js สร้างโดย `python tools/build_search_index.py` — ถ้าเพิ่ม/แก้เนื้อหาหน้า HTML ต้องรันสคริปต์นี้ใหม่
