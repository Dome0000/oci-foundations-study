# PLAN.md — OCI Foundations Study Site (1Z0-1085-26)

## สถานะโดยรวม
- [x] Phase 0 — Research & Plan (blueprint ยืนยันไม่ได้จาก sandbox นี้: ดู NOTES.md; ใช้ค่าจาก PROMPT.md + แบนเนอร์เตือน)
- [ ] Phase 1 — Foundation (design system, layout, nav, dark/light)
- [ ] Phase 2 — Content (ลำดับ: D2 → D1 → D3 → D4; 1 commit ต่อโดเมน)
  - [ ] d2a-compute-cloud-native.html
  - [ ] d2b-networking.html
  - [ ] d2c-storage-database.html
  - [ ] d1-getting-started.html
  - [ ] d3a-shared-security-services.html
  - [ ] d3b-iam.html
  - [ ] d4-governance-cost.html
  - [ ] cheatsheet.html
  - [ ] glossary.html
- [ ] Phase 3 — Interactive (quiz, exam, flashcards, progress, search)
  - [ ] assets/js/quiz-data.js (≥150 ข้อ, เป้าหมาย 22/75/38/15)
  - [ ] assets/js/flashcard-data.js (≥200 ใบ)
  - [ ] assets/js/glossary-data.js
  - [ ] assets/js/search-index.js (สร้างด้วย tools/build_search_index.py)
  - [ ] quiz.html / exam.html / flashcards.html
- [ ] Phase 4 — QA (validate_data.py, check_links.py, responsive 3 ขนาด, print, flow test)
- [ ] README.md / SOURCES.md / NOTES.md ครบ
- [ ] Final summary (ไฟล์ที่สร้าง, จำนวนข้อ ต่อโดเมน, รายการที่ผู้ใช้ต้องตรวจกับ Oracle)

## โครงเว็บ (site map)
index.html · d1-getting-started.html · d2a-compute-cloud-native.html · d2b-networking.html · d2c-storage-database.html · d3a-shared-security-services.html · d3b-iam.html · d4-governance-cost.html · cheatsheet.html · glossary.html · flashcards.html · quiz.html · exam.html · assets/css/style.css · assets/js/{app,quiz-data,flashcard-data,glossary-data,search-index}.js · tools/{validate_data,build_search_index,check_links}.py · SOURCES.md · NOTES.md · README.md

## หัวข้อต่อ objective
- 1.1 OCI Distributed Cloud: Public Cloud / Dedicated Region Cloud@Customer / Oracle Alloy / Multicloud (Database@Azure, @AWS, @Google Cloud) / Sovereign & Government cloud / on-premises & edge อื่นๆ (Cloud@Customer, Roving Edge) + จุดเด่น Gen 2, ราคาสม่ำเสมอ, security-first
- 1.2 Realms / Regions / ADs / Fault Domains: ความสัมพันธ์, การเลือก region (latency, residency, service availability, cost), home region, single-AD vs multi-AD, regional vs AD-specific vs global resources (ตาราง + ไดอะแกรม)
- 2.1 Compute: VM vs BM, shapes (fixed/flexible, AMD/Intel/Ampere, GPU), preemptible, Dedicated VM Host, images, boot volume, cloud-init, instance config/pool/autoscaling, access (SSH/Console Connection/Bastion); Cloud native: Container Instances, OKE (node types: managed/virtual/self-managed), OCIR, Functions, API Gateway, Events, Notifications, Streaming, Resource Manager, DevOps; ตารางตัดสินใจ Compute/Container Instances/OKE/Functions
- 2.2 Networking: VCN (CIDR, regional), subnet (public/private, regional/AD-specific), route tables, IGW/NAT/Service Gateway, DRG, Local/Remote Peering, Security Lists vs NSGs (stateful/stateless), LB (L7) vs NLB (L3/L4), DNS & Traffic Management, FastConnect vs Site-to-Site VPN, public IP ephemeral/reserved, VNIC, Flow Logs, Network Firewall; ไดอะแกรม VCN + flowchart gateway; flowchart "ทราฟฟิกต้องผ่านอะไร"
- 2.3 Storage: Block/Boot Volume (tiers, auto-tune, backup/clone/replication, volume groups), Object Storage (namespace/bucket, Standard/IA, Archive, lifecycle, versioning, replication, PAR, pre-authenticated requests), File Storage (NFS, mount target, snapshot), migration tools (Data Transfer, Data Transfer Appliance, OCI Data Migration, rsync); ตาราง Block vs Object vs File + decision tree; (เสริม) Database: Autonomous DB (ATP/ADW), Base Database, Exadata, MySQL HeatWave, NoSQL — ติดป้าย "เสริม" ถ้าไม่อยู่ใน objectives ที่ยืนยันได้
- 3.1 Shared Security Model: of-the-cloud vs in-the-cloud ตามชนิดบริการ, defense in depth, least privilege, zero trust, compliance programs (ISO 27001, SOC 1/2/3, PCI-DSS, HIPAA, GDPR...) และวิธีเข้าหาเอกสาร (Trust Center / Compliance); [เอกสารทางการ: docs.oracle.com/en-us/iaas/Content/Security]
- 3.2 Security services: Cloud Guard (target/recipe/detector/responder), Security Zones, Vault (key/secret, HSM vs software, CMK), WAF, DDoS Protection, Network Firewall, Bastion, Data Safe, Vulnerability Scanning, Audit/Logging/Monitoring, Certificates, encryption at rest/in transit; ตาราง Cloud Guard vs Security Zones vs Data Safe
- 3.3 IAM: tenancy, compartments (hierarchy + policy inheritance), user/group/dynamic group, identity domains, MFA/SSO/federation (SAML/OIDC), API keys/auth tokens, instance principals, policy syntax (`Allow <subject> to <verb> <resource-type> in <location> where <conditions>`), verbs inspect/read/use/manage, conditions (request.permission, target.resource.id, ...), tags (free-form vs defined), ≥10 แบบฝึก policy
- 4.1 Pricing: Universal Credits, Pay As You Go vs monthly, Free Tier (Always Free vs 30-day trial — ห้ามฝังตัวเลข, ลิงก์ + "ตรวจสอบก่อนสอบ"), BYOL vs License Included, ราคาเท่ากันทุก region, Cost Estimator, SLA, Support tiers
- 4.2 Cost management: Budgets (compartment/cost-tracking tag, alert rules), Cost Analysis, Cost/Usage Reports, cost-tracking tags + tag defaults, Quotas vs Service Limits vs Budgets, Cloud Advisor, compartment design สำหรับแยกต้นทุน, เครื่องมือ (Console/Cloud Shell/CLI/SDK/Resource Manager)

## แหล่งอ้างอิงหลัก (ดู SOURCES.md สำหรับรายการเต็ม + URL ที่ยังไม่ตรวจ)
- docs.oracle.com/en-us/iaas/ (OCI docs landing — ตรวจแล้วว่าเข้าถึงได้จาก sandbox)
- docs.oracle.com/en-us/iaas/Content/Compute/home.htm · .../Network/Concepts/landing.htm · .../Block/home.htm · .../Object/home.htm · .../File/home.htm · .../cloud-guard/home.htm · .../Identity/home.htm · .../General/build-and-deploy.htm
- หน้าข้อสอบทางการ (education.oracle.com) — เข้าไม่ได้จากสภาพแวดล้อมนี้ → แบนเนอร์เตือน + NOTES.md

## กฎการทำงาน
- file:// เท่านั้น: ห้าม ES modules / fetch ไฟล์ท้องถิ่น / CDN / ฟอนต์ภายนอก; ไดอะแกรมเป็น inline SVG
- ทุกหน้า: semantic HTML, คีย์บอร์ดใช้ได้, contrast WCAG AA, prefers-reduced-motion, dark/light
- เนื้อหาภาษาไทย + ศัพท์อังกฤษตาม Oracle (ครั้งแรกใส่คำแปลไทยในวงเล็บ)
- ห้ามคัดลอกข้อความยาวจากเอกสาร; ห้ามเดาตัวเลข — ติดป้าย [ตรวจสอบกับเอกสารทางการ]
- commit ต่อโดเมน: `git add -A && git commit -m "..."`
