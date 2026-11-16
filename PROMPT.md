# บทบาท
คุณคือ OCI Certified Instructor ที่สอนคนไทยสอบ Oracle Cloud Infrastructure มาหลายรุ่น และเป็น Frontend Developer ฝีมือดีในคนเดียวกัน

# เป้าหมาย
สร้างเว็บเอกสารเตรียมสอบ "Oracle Cloud Infrastructure 2026 Foundations Associate (1Z0-1085-26)" ฉบับละเอียด เป็น static website (HTML + CSS + JavaScript ล้วน) ในโฟลเดอร์ ./oci-foundations-study/ โดยต้อง:
- เปิดด้วยการดับเบิลคลิก index.html ได้ทันที (file://) ไม่ต้องมี server, npm, build step หรืออินเทอร์เน็ต
- อธิบายเป็นภาษาไทย แต่คงชื่อบริการและศัพท์เทคนิคเป็นภาษาอังกฤษตาม Oracle (ครั้งแรกที่เจอให้ใส่คำแปลไทยในวงเล็บ เช่น Availability Domain (AD) – โดเมนความพร้อมใช้งาน) เพราะข้อสอบจริงเป็นภาษาอังกฤษ
- เขียนสำหรับมือใหม่ที่ไม่มีพื้นฐาน cloud แต่ต้องการสอบผ่านจริง
- ครบวงจรในที่เดียว: อ่านเนื้อหา → ทำแบบฝึกหัด → จำลองสอบ → ดูจุดอ่อนตามโดเมน → ทบทวน

# 1) ข้อมูลข้อสอบ (ต้องตรวจสอบก่อนเริ่มเขียน)
ข้อมูลตั้งต้น (จากเว็บภายนอก ยังไม่ยืนยันกับ Oracle):
- รหัสสอบ 1Z0-1085-26 ใช้ตั้งแต่ มิ.ย. 2026 แทน 1Z0-1085-25
- 40 ข้อ, 60 นาที, ผ่าน 65%, ปรนัย (มีทั้งเลือกข้อเดียวและเลือกหลายข้อ)
- โดเมนและน้ำหนัก:
  1. Getting Started with OCI (15%): 1.1 Explore OCI Distributed Cloud, 1.2 Understand OCI Regions and Availability Domains
  2. Core OCI Services (50%): 2.1 Compute, 2.2 Networking, 2.3 Storage
  3. Security Services (25%): 3.1 Shared Security Model, 3.2 Security services, 3.3 Identity and Access Management
  4. Governance and Administration (10%): 4.1 Pricing model, 4.2 Cost management tools

ให้ใช้ WebSearch/WebFetch ตรวจสอบกับหน้าข้อสอบอย่างเป็นทางการของ Oracle University และเอกสารที่ docs.oracle.com
- ถ้าข้อมูลต่างจากด้านบน ให้ยึดตาม Oracle แล้วบันทึกความต่างไว้ใน NOTES.md
- ถ้าเข้าเว็บไม่ได้ ให้ใช้ข้อมูลด้านบนและแสดงแบนเนอร์ในหน้าแรกว่า "ตรวจสอบรายละเอียดข้อสอบกับหน้าทางการของ Oracle ก่อนสอบ"
- ถ้ารายการ objectives ทางการมีหัวข้อที่ไม่ตรงกับด้านบน ให้หยุดและสรุปให้ผมก่อนทำต่อ

# 2) ลำดับการทำงาน
Phase 0 – Research & Plan: ตรวจสอบข้อมูลข้อสอบ อ่าน docs.oracle.com ของบริการที่เกี่ยวข้อง แล้วเขียน PLAN.md (โครงเว็บ, รายการหัวข้อต่อ objective, แหล่งอ้างอิง, สถานะงาน) ใช้ไฟล์นี้ติดตามความคืบหน้าเพื่อให้ทำต่อได้ถ้า context เต็ม
Phase 1 – Foundation: ทำ design system (CSS variables, typography, components), layout, navigation, dark/light mode
Phase 2 – Content: เขียนเนื้อหาทีละโดเมน (เริ่ม Domain 2 ก่อนเพราะน้ำหนัก 50%) เสร็จแต่ละโดเมนให้ self-review ความถูกต้อง แล้ว git commit
Phase 3 – Interactive: quiz, flashcards, exam simulation, progress tracking, search
Phase 4 – QA: ตามหัวข้อ 9
ทำต่อเนื่องไม่ต้องรอผมยืนยันทีละขั้น ยกเว้นเจอข้อมูลที่ขัดแย้งกับ prompt นี้

# 3) โครงสร้างไฟล์
oci-foundations-study/
- index.html – ภาพรวมข้อสอบ, แผนอ่าน 3 สัปดาห์, ความคืบหน้ารวม, ทางลัดไปทุกส่วน
- d1-getting-started.html
- d2a-compute-cloud-native.html, d2b-networking.html, d2c-storage-database.html
- d3a-shared-security-services.html, d3b-iam.html
- d4-governance-cost.html
- cheatsheet.html – สรุป 1–2 หน้าสำหรับอ่านก่อนสอบ (print-friendly)
- glossary.html – ศัพท์ A–Z พร้อมค้นหา
- flashcards.html, quiz.html (ฝึกตามโดเมน/objective), exam.html (จำลองสอบ)
- assets/css/style.css, assets/js/app.js
- assets/js/quiz-data.js, flashcard-data.js, glossary-data.js, search-index.js (โหลดด้วย <script> ธรรมดา เก็บข้อมูลเป็น window.XXX = ...)
- tools/ (สคริปต์ตรวจสอบและสร้าง search index), SOURCES.md, NOTES.md, README.md
ข้อจำกัดเพราะต้องใช้ผ่าน file://: ห้ามใช้ ES modules, ห้าม fetch ไฟล์ local, ห้ามพึ่ง CDN/ฟอนต์ภายนอก ใช้ font stack ที่รองรับไทยในเครื่อง (เช่น "Sarabun", "Noto Sans Thai", system-ui) และไดอะแกรมให้เขียนเป็น inline SVG เอง

# 4) เนื้อหาที่ต้องครอบคลุม
ตรวจแต่ละข้อกับเอกสารทางการ ใช้ชื่อบริการปัจจุบัน (ถ้าเพิ่งเปลี่ยนชื่อให้ใส่ชื่อเดิมในวงเล็บ)

Domain 1 – Getting Started (15%)
- พื้นฐาน cloud: IaaS/PaaS/SaaS, CapEx vs OpEx, elasticity vs scalability, HA vs DR (RTO/RPO)
- 1.1 OCI Distributed Cloud: Public Cloud, Dedicated Region Cloud@Customer, Oracle Alloy, Multicloud (เช่น Oracle Database@Azure/AWS/Google Cloud), Sovereign/Government cloud และตัวเลือก on-premises/edge อื่นที่เป็นปัจจุบัน; จุดเด่นของ OCI (Gen 2 architecture, ราคาและบริการสม่ำเสมอทุกรูปแบบ, security-first)
- 1.2 Realms, Regions, Availability Domains, Fault Domains: ความสัมพันธ์ ข้อดีของแต่ละระดับ การเลือก region (latency, data residency/compliance, service availability, cost), home region, single-AD vs multi-AD region, ทรัพยากรไหนเป็น regional / AD-specific / global ทำเป็นตารางและไดอะแกรม

Domain 2 – Core OCI Services (50%) ลงลึกที่สุด
- 2.1 Compute: VM vs Bare Metal, shapes (fixed/flexible), ตระกูล shape และสถาปัตยกรรม CPU/GPU, preemptible instances, Dedicated VM Hosts, images (platform/custom), boot volume, cloud-init, instance configuration/instance pool/autoscaling, การเข้าถึง instance (SSH, Console Connection, Bastion)
  Cloud native: Container Instances, OKE (Kubernetes) และชนิด node, OCIR, Functions, API Gateway, Events, Notifications, Streaming, Resource Manager (Terraform), DevOps; ตารางตัดสินใจ "ควรใช้ Compute/Container Instances/OKE/Functions เมื่อไหร่"
- 2.2 Networking: VCN (CIDR, regional), subnet (public/private, regional vs AD-specific), route tables, Internet Gateway, NAT Gateway, Service Gateway, DRG, Local/Remote Peering, Security Lists vs Network Security Groups (stateful/stateless), Load Balancer (L7) vs Network Load Balancer (L3/L4), DNS และ traffic management, FastConnect vs Site-to-Site VPN, public IP แบบ ephemeral/reserved, VNIC, VCN Flow Logs, Network Firewall; ไดอะแกรม VCN ครบวงจร และ flowchart "ทราฟฟิกนี้ต้องผ่าน gateway ไหน"
- 2.3 Storage: Block Volume และ Boot Volume (performance tiers, auto-tune, backup/clone/replication, volume groups), Object Storage (namespace, bucket, Standard/Infrequent Access/Archive, lifecycle policy, versioning, replication, Pre-Authenticated Requests, private vs public), File Storage (NFS, mount target, snapshot), บริการย้ายข้อมูล; ตารางเปรียบเทียบ Block vs Object vs File และ decision tree
- (เสริม) Database และ data platform: Autonomous Database (ATP/ADW และอื่นๆ), Base Database, Exadata, MySQL HeatWave, NoSQL ให้ตรวจว่าอยู่ใน objectives ปัจจุบันหรือไม่ ถ้าไม่ ให้ทำเป็นส่วน "รู้จักไว้" แบบสั้นและติดป้าย "เสริม"

Domain 3 – Security Services (25%)
- 3.1 Shared Security Model: Oracle รับผิดชอบ security of the cloud / ลูกค้ารับผิดชอบ security in the cloud แยกตามชนิดบริการ, principles (defense in depth, least privilege, zero trust), compliance programs และวิธีเข้าถึงเอกสาร compliance
- 3.2 Security services: Cloud Guard (detector/responder/target/recipe), Security Zones, Vault (keys/secrets, HSM vs software, customer-managed keys), WAF, DDoS Protection, Network Firewall, Bastion, Data Safe, Vulnerability Scanning, Audit/Logging/Monitoring, Certificates, encryption at rest/in transit; ตารางเปรียบเทียบบริการที่มักสับสน (เช่น Cloud Guard vs Security Zones vs Data Safe)
- 3.3 IAM: tenancy, compartment (hierarchy, policy inheritance), user/group/dynamic group, identity domains, MFA/SSO/federation, API keys/auth tokens, instance principals/resource principals, policy syntax (Allow <subject> to <verb> <resource-type> in <location> where <conditions>) และ verbs (inspect/read/use/manage) พร้อมแบบฝึกอ่าน-เขียน policy อย่างน้อย 10 ตัวอย่าง, tags (free-form vs defined)

Domain 4 – Governance and Administration (10%)
- 4.1 Pricing model: Universal Credits และรูปแบบการจ่ายเงินปัจจุบัน, Free Tier (Always Free vs trial credit), BYOL vs License Included, ราคาสม่ำเสมอทุก region, Cost Estimator, SLA (availability/manageability/performance), รูปแบบ Support
- 4.2 Cost management: Budgets (ตั้งบน compartment/cost-tracking tag, alert rule), Cost Analysis, Cost/Usage Reports, cost-tracking tags และ tag defaults, Quotas vs Service Limits vs Budgets (สรุปความต่างชัดๆ), Cloud Advisor, การออกแบบ compartment เพื่อแยกต้นทุน; เครื่องมือบริหาร (Console, Cloud Shell, CLI, SDK, Resource Manager)
- ห้ามฝังตัวเลขราคา/โควตา Free Tier ที่เปลี่ยนได้ ให้ลิงก์ไปหน้าทางการและติดป้าย "ตรวจสอบก่อนสอบ"

# 5) รูปแบบการเขียนแต่ละหัวข้อ (ใช้เหมือนกันทั้งเว็บ)
1. Why it matters: บริการนี้แก้ปัญหาอะไร พร้อมอุปมาเข้าใจง่าย 1 อัน
2. Key concepts: อธิบายทีละแนวคิด เรียงจากง่ายไปยาก
3. ตาราง/ไดอะแกรม: เปรียบเทียบสิ่งที่คล้ายกัน และภาพสถาปัตยกรรม (inline SVG)
4. Exam Focus: สิ่งที่ข้อสอบชอบถาม และ "คำสัญญาณในโจทย์ → คำตอบที่น่าจะเป็น"
5. Common Traps: จุดที่คนมักตอบผิด พร้อมเหตุผล
6. Scenario: ตัวอย่างโจทย์สถานการณ์ 1–2 ข้อ พร้อมวิธีคิด
7. Check yourself: 3–5 คำถามสั้น กดเปิดดูเฉลยได้
8. Sources: ลิงก์ docs.oracle.com ที่ใช้
ใช้ callout box แยกสี/ป้ายสำหรับ Exam Focus, Trap, Tip, เสริม (นอกขอบเขตสอบ) เนื้อหาต้องลงลึกพอให้ตอบโจทย์สถานการณ์ได้ ไม่ใช่แค่ท่องชื่อบริการ

# 6) ฟีเจอร์เว็บ
- Sidebar สารบัญแบบ sticky + scrollspy (มือถือเป็นเมนูแบบ drawer), breadcrumb, ปุ่มก่อนหน้า/ถัดไป
- ค้นหาทั้งไซต์ (กด / เพื่อโฟกัส) ใช้ search-index.js ที่สร้างจากสคริปต์ใน tools/
- Progress tracking ด้วย localStorage (ครอบ try/catch และมี fallback ถ้าใช้ไม่ได้): ติ๊กจบแต่ละ objective, แถบความคืบหน้าแยกโดเมน, ปุ่ม export/import เป็น JSON, ปุ่ม reset
- Quiz: เลือกโดเมน/objective/ความยาก, รองรับเลือกข้อเดียวและหลายข้อ, เฉลยทันทีพร้อมอธิบายว่าทำไมข้อที่เหลือผิด, bookmark ข้อ, โหมดทบทวนเฉพาะข้อที่ตอบผิด, สรุปคะแนนแยกโดเมนพร้อมแนะนำว่าให้กลับไปอ่านส่วนไหน (ลิงก์ตรงไปหัวข้อ)
- Exam simulation: 40 ข้อ จับเวลา 60:00, สุ่มข้อตามน้ำหนักโดเมน (ประมาณ 6/20/10/4), flag ข้อเพื่อกลับมาดู, หน้าสรุปผล ผ่านเมื่อ ≥ 65%, เก็บประวัติผลสอบเป็นกราฟพัฒนาการ
- Flashcards: พลิกการ์ด, ทำเครื่องหมายจำได้/ยังไม่ได้, ระบบทบทวนแบบ Leitner อย่างง่าย, กรองตามโดเมน
- Cheatsheet พิมพ์ได้ (print CSS), Glossary ค้นหาได้
- Accessibility: semantic HTML, ใช้คีย์บอร์ดได้ทั้งหมด, contrast ระดับ WCAG AA, เคารพ prefers-reduced-motion

# 7) คลังข้อสอบและ Flashcards
- Quiz bank อย่างน้อย 150 ข้อ แบ่งตามน้ำหนักโดเมน (ประมาณ 22/75/38/15) โจทย์เขียนเป็นภาษาอังกฤษสไตล์ข้อสอบจริง คำอธิบายเป็นภาษาไทย
- แต่ละข้อมี: id, domain, objective, type (single/multi), difficulty, question, options, answer, explanation, wrongWhy (เหตุผลที่ตัวเลือกอื่นผิด), refLink
- ต้องเขียนข้อสอบขึ้นใหม่ทั้งหมดจากความเข้าใจเอกสารทางการ ห้ามคัดลอกหรือดัดแปลงจากข้อสอบจริง, dump, หรือเว็บ braindump
- ผสมระดับ: จำศัพท์ 30%, เข้าใจแนวคิด 40%, สถานการณ์ตัดสินใจ 30%
- Flashcards อย่างน้อย 200 ใบ (ศัพท์, "X ต่างจาก Y อย่างไร", ข้อจำกัด/ค่าที่ต้องจำ, policy syntax)
- เขียนสคริปต์ใน tools/ ตรวจข้อมูล: id ไม่ซ้ำ, answer อยู่ในตัวเลือก, ทุกข้อมี explanation, สัดส่วนโดเมนใกล้เคียงที่กำหนด

# 8) ดีไซน์
- ให้ความรู้สึกเหมือนคู่มือเทคนิคที่ออกแบบมาดี: อ่านสบาย ความกว้างบรรทัด 65–75 ตัวอักษร ระยะห่างโปร่ง ตัวอักษรไทยอ่านง่าย (line-height ไม่ต่ำกว่า 1.7)
- พื้นหลังโทนอุ่นเป็นกลาง ใช้แดงแบบ Oracle (#C74634 หรือใกล้เคียง) เป็น accent เท่าที่จำเป็น และกำหนดสีประจำโดเมน 4 สีที่ใช้ซ้ำทั้งเว็บ (แถบสี, badge, กราฟ)
- หลีกเลี่ยงหน้าตา "template AI" ทั่วไป เช่น gradient ม่วง, การ์ดเงาเยอะ, emoji เกลื่อน
- รองรับ dark/light mode, responsive ที่ 360 / 768 / 1280px
- ห้ามใช้โลโก้หรือรูปภาพที่เป็นเครื่องหมายการค้าของ Oracle ใส่ footer ว่าเป็นสื่อการเรียนที่ไม่เป็นทางการและไม่เกี่ยวข้องกับ Oracle

# 9) กฎคุณภาพและเกณฑ์ว่างานเสร็จ
ความถูกต้อง
- ทุกข้อเท็จจริงต้องตรวจกับ docs.oracle.com; ถ้าไม่มั่นใจตัวเลข/ข้อจำกัดใด ให้ไม่ใส่ หรือใส่ป้าย "[ตรวจสอบกับเอกสารทางการ]" อย่าเดา
- เขียนเนื้อหาด้วยภาษาของตัวเอง ห้ามวางข้อความจากเอกสารยาวๆ
- บันทึกแหล่งอ้างอิงทั้งหมดใน SOURCES.md
Definition of Done
- [ ] ทุก objective 1.1–4.2 มีเนื้อหาครบตามรูปแบบหัวข้อ 5
- [ ] เปิดทุกหน้าจาก file:// ได้ ไม่มี console error ไม่มี request ออกอินเทอร์เน็ต
- [ ] ลิงก์ภายในทุกลิงก์ใช้ได้ (เขียนสคริปต์ตรวจ)
- [ ] สคริปต์ตรวจ quiz/flashcard data ผ่านทั้งหมด
- [ ] ทดสอบ responsive 3 ขนาดและ print ของ cheatsheet
- [ ] ทดสอบ flow จริง: ทำ quiz → ดูสรุปจุดอ่อน → จำลองสอบ → progress ถูกบันทึกหลังรีเฟรช
- [ ] README.md บอกวิธีเปิดใช้งานและวิธีแก้ไข/เพิ่มข้อสอบ
เมื่อเสร็จ ให้สรุป: ไฟล์ที่สร้าง, จำนวนข้อสอบ/flashcards ต่อโดเมน, และรายการที่ยังต้องให้ผมตรวจสอบกับ Oracle เอง