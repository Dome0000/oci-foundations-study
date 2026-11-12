# OCI Foundations Study — 1Z0-1085-26 (เตรียมสอบภาษาไทย)

เว็บเอกสารเตรียมสอบ **Oracle Cloud Infrastructure 2026 Foundations Associate (1Z0-1085-26)** ภาษาไทย (ศัพท์เทคนิคเป็นอังกฤษตามข้อสอบจริง) — เปิดผ่าน `file://` ได้ทันที ไม่ต้องมี server, npm, build step หรืออินเทอร์เน็ต

## วิธีเปิดใช้งาน
1. ดับเบิลคลิก `index.html` (หรือเปิดจากเบราว์เซอร์ด้วย `file:///.../oci-foundations-study/index.html`)
2. อ่านเนื้อหาตาม Domain 1→4 (แนะนำเริ่ม D2 เพราะน้ำหนัก 50%)
3. ติ๊ก objectives ที่อ่านจบบนหน้า index.html (ความคืบหน้าเก็บในเครื่องคุณ)
4. ไปที่ **แบบฝึกหัด** (`quiz.html`) ฝึกตามโดเมน → **จำลองสอบ** (`exam.html`) 40 ข้อ/60 นาที → **Flashcards** (`flashcards.html`) ทบทวนด้วย Leitner
5. ก่อนสอบ: อ่าน `cheatsheet.html` (พิมพ์ได้) และตรวจสอบรายละเอียดข้อสอบกับ Oracle University ก่อนเสมอ

> **สื่อการเรียนที่ไม่เป็นทางการ** — ไม่เกี่ยวข้องหรือได้รับการรับรองจาก Oracle · ข้อมูลข้อสอบ (40 ข้อ/60 นาที/ผ่าน 65%/โดเมน 15-50-25-10) จากข้อมูลที่ให้มา ยังไม่ยืนยันกับหน้าทางการ — ดูแบนเนอร์ใน `index.html` และ `NOTES.md`

## โครงสร้าง
```
oci-foundations-study/
├─ index.html                      ภาพรวมข้อสอบ, แผนอ่าน 3 สัปดาห์, ความคืบหน้า, ทางลัด
├─ d1-getting-started.html         Domain 1: Distributed Cloud, Regions/ADs/FDs
├─ d2a-compute-cloud-native.html   2.1 Compute, VM/BM, OKE, Functions, OCIR…
├─ d2b-networking.html             2.2 VCN, gateways, LB, VPN/FastConnect…
├─ d2c-storage-database.html       2.3 Block/Object/File + (เสริม) Database
├─ d3a-shared-security-services.html  3.1–3.2 Shared model, Cloud Guard, Vault…
├─ d3b-iam.html                    3.3 IAM + แบบฝึก policy 12 ข้อ
├─ d4-governance-cost.html         4.1–4.2 Pricing, Budgets, Cost Analysis…
├─ cheatsheet.html                 สรุป 1–2 หน้า พิมพ์ได้ (ตอบก่อนสอบ)
├─ glossary.html                   ศัพท์ A–Z ค้นหาได้
├─ flashcards.html                 การ์ด 200 ใบ + Leitner 5 กล่อง
├─ quiz.html                       แบบฝึก 150 ข้อ (กรอง domain/objective/ความยาก/ชนิด)
├─ exam.html                       จำลองสอบ 40 ข้อ/60 นาที + กราฟพัฒนาการ
├─ assets/css/style.css            design system (light/dark, responsive, print)
├─ assets/js/app.js                sidebar/scrollspy/search/progress/theme
├─ assets/js/{quiz-data,flashcard-data,glossary-data,search-index}.js
├─ tools/validate_data.py          ตรวจ quiz/flashcard data
├─ tools/build_search_index.py     สร้าง search-index.js จาก HTML
├─ tools/check_links.py            ตรวจลิงก์ภายใน + ห้าม external src
├─ PLAN.md                         สถานะงาน (ติดตามความคืบหน้า)
├─ SOURCES.md                      แหล่งอ้างอิงทั้งหมด
└─ NOTES.md                        สิ่งที่ผู้ใช้ต้องตรวจสอบ/ความไม่แน่นอน
```

## คีย์ลัด
- `/` — เปิดค้นหาทั้งเว็บ (พิมพ์แล้ว Enter เพื่อไปลิงก์ที่เลือก)
- `Esc` — ปิดการค้นหา/เมนูมือถือ
- `F` (ในหน้าจำลองสอบ) — flag ข้อ
- `Enter`/`Space` (บนการ์ด) — พลิก flashcard

## วิธีแก้ไข/เพิ่มข้อสอบ
1. เปิด `assets/js/quiz-data.js` แล้วเพิ่ม object ตามรูปแบบ:
   ```js
   { id: "q-d2-999", domain: "2", objective: "2.2", type: "single", difficulty: "understand",
     question: "... (อังกฤษ)",
     options: ["...", "...", "...", "..."],
     answer: [0],                    // index ของตัวเลือกที่ถูก (multi = หลาย index)
     explanation: "ทำไม (ไทย)",
     wrongWhy: "ทำไมข้ออื่นผิด",
     refLink: "https://docs.oracle.com/..." },
   ```
   - `type`: `single` (1 คำตอบ) หรือ `multi` (≥2 คำตอบ)
   - `difficulty`: `recall` / `understand` / `scenario`
   - `domain`: `"1"`–`"4"`, `objective`: `"1.1"`…`"4.2"`
2. ใส่ comma ต่อท้าย object ทุกตัวยกเว้นตัวสุดท้ายก่อน `];`
3. รัน `python tools/validate_data.py` — ต้องผ่านทั้งหมด (id ไม่ซ้ำ, เฉลยอยู่ในตัวเลือก, สัดส่วนโดเมน ≈ 22/75/38/15, ≥150 ข้อ)
4. เพิ่ม/แก้เนื้อหา HTML → รัน `python tools/build_search_index.py` เพื่ออัปเดตผลค้นหา

## วิธีเพิ่ม flashcard
เพิ่ม object ใน `assets/js/flashcard-data.js` (`{id, domain, front, back, tags}`) แล้วรัน `python tools/validate_data.py` (ต้อง ≥200 ใบ)

## วิธี export/import ความคืบหน้า
หน้าแรก → ปุ่ม "ส่งออกความคืบหน้า (JSON)" (ดาวน์โหลด) / "นำเข้าความคืบหน้า" (อัปโหลดไฟล์ JSON) / "รีเซ็ตความคืบหน้า"

## QA ที่รันแล้ว
- `python tools/validate_data.py` — ผ่าน (150 ข้อ: D1 22 · D2 75 · D3 38 · D4 15; 200 การ์ด; difficulty 43/70/37)
- `python tools/check_links.py` — ผ่าน (ลิงก์ภายในครบ, ไม่มี `<script>/<img>` ภายนอก)
- `python tools/build_search_index.py` — สร้าง 116 entries
- หมายเหตุ: การทดสอบ responsive/print และ flow จริงทำได้โดยเปิด `index.html` ในเบราว์เซอร์ที่รองรับ — ดูหัวข้อ "QA checklist" ด้านล่าง

## QA checklist สำหรับผู้ใช้ (เปิดในเบราว์เซอร์)
- [ ] ทุกหน้าเปิดผ่าน `file://` ได้ ไม่มี error ใน console (F12) และไม่มี request ออกอินเทอร์เน็ต (แท็บ Network)
- [ ] Quiz: ทำรอบเสร็จ → สรุปแยกโดเมน + ลิงก์กลับไปอ่านวัตถุประสงค์ที่ผิด → progress ถูกบันทึก (ลองรีเฟรช)
- [ ] Exam: 40 ข้อ → flag ได้ → ส่งแล้วกราฟพัฒนาการแสดงผล
- [ ] Flashcards: พลิกการ์ด, ปุ่มจำได้/ไม่ได้, กล่องสะสมตาม Leitner
- [ ] Cheatsheet: Ctrl+P → พิมพ์ได้ 2 คอลัมน์ ไม่มี sidebar/header
- [ ] ขนาดหน้าจอ 360px / 768px / 1280px — layout ไม่แตก, เมนูมือถือ drawer ทำงาน

## License / การใช้งาน
เขียนเองทั้งหมดจากเอกสารสาธารณะของ Oracle — ใช้เพื่อการเรียนรายบุคคล ไม่ขาย
Oracle, OCI, และชื่อบริการอื่น ๆ เป็นเครื่องหมายการค้าของ Oracle และเจ้าของแต่ละราย
