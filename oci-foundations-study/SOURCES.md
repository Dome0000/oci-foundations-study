# SOURCES.md — แหล่งอ้างอิงที่ใช้สร้างเนื้อหา

ทุกลิงก์อยู่บน **docs.oracle.com** (หรือเว็บทางการของ Oracle) เว้นแต่ระบุไว้ — เข้าถึงได้จากสภาพแวดล้อมที่สร้างเว็บนี้
**ข้อสอบ 1Z0-1085-26 ที่คร่าวใน PROMPT.md ยังไม่ได้รับการยืนยันกับหน้าทางการของ Oracle University** (ดู NOTES.md)

## แหล่งทางการระดับบน
- OCI Documentation Library — https://docs.oracle.com/en-us/iaas/ (ตรวจแล้วว่าเข้าถึงได้ ณ 2026-11-12)
- OCI Free Tier — https://www.oracle.com/cloud/free/ (อ้างอิงในเนื้อหา โดยไม่ฝังตัวเลข)
- OCI Cost Estimator — https://www.oracle.com/cloud/cost-estimator/
- OCI SLA — https://www.oracle.com/cloud/cloud-infrastructure-service-level-agreement-sla/
- OCI Compliance / Trust Center — https://www.oracle.com/cloud/cloud-infrastructure/compliance/ (หน้า compliance list)

## Domain 1 — Getting Started
- Regions and Availability Domains — https://docs.oracle.com/en-us/iaas/Content/General/Concepts/regions.htm (ยืนยัน realm/OC1, AD มี 3 FDs, multi-AD region 5 แห่ง — Phoenix/Ashburn/Chicago/London/Frankfurt, single-AD ที่เหลือ, IAM = cross-region, subscriptions limit 1 region สำหรับ trial/PAYG, AD names สุ่มต่อ tenancy, bucket regional แต่เข้าผ่าน URL ได้ทุกที่, ทราฟฟิกข้าม AD/region เข้ารหัส)
- Dedicated Cloud architecture — https://docs.oracle.com/iaas/Content/dedicated/dedicated-cloud-architecture.htm (Dedicated Region, Alloy)
- Dedicated Region overview — https://docs.oracle.com/iaas/Content/dedicated/dedicated-region/dedicated-region-overview.htm
- Oracle Alloy overview — https://docs.oracle.com/iaas/Content/dedicated/alloy/oracle-alloy-overview.htm
- Oracle Multicloud Hub — https://docs.oracle.com/iaas/Content/multicloud-hub/home.htm
- Oracle AI Database@Azure — https://docs.oracle.com/iaas/Content/database-at-azure/oaa.htm
- Oracle AI Database@AWS — https://docs.oracle.com/iaas/Content/database-at-aws/oaaws.htm
- Oracle AI Database@Google Cloud — https://docs.oracle.com/iaas/Content/database-at-gcp/home.htm
- Oracle Interconnect for Azure — https://docs.oracle.com/iaas/Content/multicloud/interconnect-azure.htm (เช่นเดียวกับ interconnect-aws.htm, interconnect-gcp.htm)
- Compute Cloud@Customer — https://docs.oracle.com/iaas/compute-cloud-at-customer/ccc/home.htm
- Roving Edge Infrastructure — https://docs.oracle.com/iaas/roving-edge-infrastructure/rvr/home.htm
- Private Cloud Appliance — https://docs.oracle.com/iaas/private-cloud-appliance/pca/home.htm

หมายเหตุชื่อผลิตภัณฑ์: ชื่อที่เป็นทางการ ณ เวลาที่เขียนคือ **"Oracle AI Database@Azure/@AWS/@Google Cloud"** (Oracle rebrand 2025) — ชื่อเดิมคือ "Oracle Database@..."; PROMPT.md เดิมใช้ชื่อเดิมจึงใส่ชื่อเดิมในวงเล็บตามกฎของ prompt

## Domain 2 — Core Services
### Compute (2.1)
- OCI Compute — https://docs.oracle.com/en-us/iaas/Content/Compute/home.htm
- Compute shapes (OCPU/vCPU, flexible shapes) — https://docs.oracle.com/en-us/iaas/Content/Compute/References/computeshapes.htm (ยืนยัน: x86 1 OCPU = 2 vCPU, Arm A1 = 1, A2/A4 = 2; flex min 1 GB/OCPU, max 64 GB/OCPU; Always Free Micro/A1-eligible; DenseIO = local NVMe ephemeral; BM shapes; DVH)
- Oracle Kubernetes Engine (OKE) — https://docs.oracle.com/en-us/iaas/Content/ContEng/home.htm (node types: Managed / Virtual / Self-managed)
- Oracle Cloud Infrastructure Registry (OCIR) — https://docs.oracle.com/en-us/iaas/Content/Registry/home.htm
- Functions — https://docs.oracle.com/en-us/iaas/Content/Functions/home.htm
- API Gateway — https://docs.oracle.com/en-us/iaas/Content/APIGateway/home.htm
- Events — https://docs.oracle.com/en-us/iaas/Content/Events/home.htm
- Notifications — https://docs.oracle.com/en-us/iaas/Content/Notification/home.htm
- Streaming — https://docs.oracle.com/en-us/iaas/Content/Streaming/home.htm
- Resource Manager — https://docs.oracle.com/en-us/iaas/Content/ResourceManager/home.htm
- DevOps — https://docs.oracle.com/en-us/iaas/Content/devops/home.htm
- Container Instances — https://docs.oracle.com/en-us/iaas/Content/ContainerEngine/home.htm (ตรวจหน้า home ของ Container Instances ใน docs; ถ้า 404 ค้น "Container Instances" จากหน้า OCI docs)

### Networking (2.2)
- OCI Networking landing — https://docs.oracle.com/en-us/iaas/Content/Network/Concepts/landing.htm (ยืนยัน: VCN regional, CIDR /16–/30, public subnet = route→IGW, NAT = outbound-only, SGW = Oracle Services Network, DRG, LPG, stateful-by-default security rules, longest prefix match, subnet regional แนะนำ vs AD-specific)
- VCN — https://docs.oracle.com/en-us/iaas/Content/Network/Concepts/vcn.htm
- Security rules (Security Lists / NSG) — https://docs.oracle.com/en-us/iaas/Content/Network/Concepts/securityrules.htm
- Subnets / VNICs — https://docs.oracle.com/en-us/iaas/Content/Network/Concepts/vnics.htm
- Load Balancer — https://docs.oracle.com/en-us/iaas/Content/Balance/home.htm
- Network Load Balancer — https://docs.oracle.com/en-us/iaas/Content/NetworkLoadBalancer/home.htm
- FastConnect — https://docs.oracle.com/en-us/iaas/Content/Network/Concepts/fastconnect.htm
- Site-to-Site VPN — https://docs.oracle.com/en-us/iaas/Content/Network/Concepts/site-to-site-vpn.htm
- DNS (incl. Traffic Management) — https://docs.oracle.com/en-us/iaas/Content/DNS/home.htm
- Network Firewall — https://docs.oracle.com/en-us/iaas/Content/network-firewall/home.htm
- Bastion — https://docs.oracle.com/en-us/iaas/Content/Bastion/home.htm

### Storage (2.3)
- Object Storage overview — https://docs.oracle.com/en-us/iaas/Content/Object/Concepts/objectstorageoverview.htm (ยืนยัน: namespace system-generated/unique/immutable, bucket default private, tiers Standard/Infrequent Access/Archive, lifecycle, versioning, replication, PAR, AES-256 default, S3-compatible API, service CIDR 134.70.0.0/16)
- Object Storage — https://docs.oracle.com/en-us/iaas/Content/Object/home.htm
- Block Volume — https://docs.oracle.com/en-us/iaas/Content/Block/home.htm
- File Storage — https://docs.oracle.com/en-us/iaas/Content/File/home.htm
- Archive Storage — https://docs.oracle.com/en-us/iaas/Content/Archive/home.htm
- Data Transfer — https://docs.oracle.com/en-us/iaas/Content/DataTransfer/home.htm
- (เสริม) Autonomous Database — https://docs.oracle.com/en/cloud/paas/autonomous-database/index.html
- (เสริม) MySQL HeatWave — https://docs.oracle.com/en/cloud/paas/mysql-heatwave/index.html

## Domain 3 — Security
- Security overview — https://docs.oracle.com/en-us/iaas/Content/Security/Concepts/security.htm
- Cloud Guard — https://docs.oracle.com/en-us/iaas/Content/cloud-guard/home.htm
- Security Zones — https://docs.oracle.com/en-us/iaas/Content/security-zones/home.htm
- Vault (Key Management) — https://docs.oracle.com/en-us/iaas/Content/KeyManagement/home.htm
- WAF — https://docs.oracle.com/en-us/iaas/Content/WAF/home.htm
- Bastion — https://docs.oracle.com/en-us/iaas/Content/Bastion/home.htm
- Data Safe — https://docs.oracle.com/en-us/iaas/Content/datasafe/home.htm
- Audit — https://docs.oracle.com/en-us/iaas/Content/Audit/home.htm
- Logging — https://docs.oracle.com/en-us/iaas/Content/Logging/home.htm
- Monitoring — https://docs.oracle.com/en-us/iaas/Content/Monitoring/home.htm
- Vulnerability Scanning — https://docs.oracle.com/en-us/iaas/Content/vuln-scanning/home.htm
- Certificates — https://docs.oracle.com/en-us/iaas/Content/certificates/home.htm
- IAM (with identity domains) — https://docs.oracle.com/en-us/iaas/Content/Identity/home.htm
- How policies work — https://docs.oracle.com/en-us/iaas/Content/Identity/Concepts/policies.htm
- Policy reference — https://docs.oracle.com/en-us/iaas/Content/Identity/Concepts/policyreference.htm
- Compartments — https://docs.oracle.com/en-us/iaas/Content/Identity/Concepts/compartments.htm
- Dynamic groups — https://docs.oracle.com/en-us/iaas/Content/Identity/Tasks/managingDynamicGroups.htm
- Instance principals — https://docs.oracle.com/en-us/iaas/Content/Identity/Concepts/instance-principal.htm
- Tagging — https://docs.oracle.com/en-us/iaas/Content/Tagging/home.htm

## Domain 4 — Governance & Cost
- Budgets — https://docs.oracle.com/en-us/iaas/Content/Budgets/home.htm
- Billing (Cost Analysis / Cost & Usage Reports) — https://docs.oracle.com/en-us/iaas/Content/Billing/home.htm
- Quotas — https://docs.oracle.com/en-us/iaas/Content/Quotas/home.htm
- Service Limits — https://docs.oracle.com/en-us/iaas/Content/General/Concepts/servicelimits.htm
- Cloud Advisor — https://docs.oracle.com/en-us/iaas/Content/CloudAdvisor/home.htm

## แหล่งที่ *ไม่* สามารถเข้าถึงได้จากสภาพแวดล้อมนี้ (บันทึกไว้ตามกฎ "ห้ามเดา")
- https://education.oracle.com/ (ทุก path ที่ลอง) — timeout 60s
- https://www.oracle.com/ — HTTP 403
- https://blogs.oracle.com/ — HTTP 403
- https://certification.oracle.com / https://certify.oracle.com — DNS ไม่ resolve
- https://mylearn.oracle.com/ou/exams/1z0-1085-26 — โหลดได้เฉพาะ JS shell ไม่มีรายละเอียด
- WebSearch — error 403 (provider ไม่พร้อมใช้งาน)
- เสิร์ชเอ็นจิน (DuckDuckGo) — ติด captcha

ฟังค์ชั่นที่พึ่งพา 2 แหล่งข้างต้นโดยตรง (ข้อมูลข้อสอบ 1Z0-1085-26: 40 ข้อ/60 นาที/65%/โดเมน 15-50-25-10) **ไม่ได้รับการยืนยัน** — ดูแบนเนอร์ในหน้า index.html และ NOTES.md
