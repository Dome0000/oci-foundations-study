# Domain 5: Pricing, Support and Operations (10 questions: Q091 - Q100)
# 8 single, 2 multiple (Q099, Q100)
# Difficulty: 3 easy, 4 medium, 3 hard
# Scenarios: 6 true, 4 false

$domain5 = @(
    @{
        id = "oci-fnd-001-q091"
        domain = "Pricing, Support and Operations"
        subtopics = @("OCI pricing concepts", "Pay As You Go และ Universal Credits ในระดับพื้นฐาน")
        difficulty = "easy"
        type = "single"
        scenario = $false
        question = "What is the primary difference between OCI's Pay As You Go (PAYG) pricing model and the Annual Universal Credits (UCM) pricing model?"
        options = @(
            @{ id = "A"; text = "Pay As You Go bills customers monthly in arrears with no upfront commitment, whereas Annual Universal Credits offers significant volume discounts in exchange for an upfront annual spending commitment." },
            @{ id = "B"; text = "Pay As You Go requires a 5-year fixed contract, while Universal Credits is strictly billed on an hourly cash basis." },
            @{ id = "C"; text = "Universal Credits can only be spent on bare metal compute, while Pay As You Go only applies to object storage." },
            @{ id = "D"; text = "Pay As You Go provides free unlimited database licenses, whereas Universal Credits requires purchasing separate physical hardware." }
        )
        correct_answer = @("A")
        explanation = "โมเดลราคาของ OCI:
- Pay As You Go (PAYG): คิดค่าบริการตามปริมาณการใช้งานจริงรายเดือนเมื่อสิ้นสุดรอบบิล โดยไม่มีข้อผูกมัดหรือขั้นต่ำล่วงหน้า
- Annual Universal Credits (UCM): องค์กรทำสัญญา commitment วงเงินการใช้งานรายปีล่วงหน้า ซึ่งจะได้รับส่วนลดค่าบริการ (Discounted rates) ในอัตราที่คุ้มค่ากว่าอย่างมาก โดยเครดิตนี้สามารถนำไปใช้กับบริการใดก็ได้ใน OCI ได้อย่างยืดหยุ่น
- ตัวเลือก B, C และ D อธิบายสลับกันหรือให้ข้อมูลที่ผิดพลาด"
        tags = @("pricing", "payg", "universal-credits", "commercial-models")
        references = @(
            @{
                title = "OCI Pricing Overview"
                url = "https://docs.oracle.com/en-us/iaas/Content/Billing/Concepts/billingoverview.htm"
            }
        )
    },
    @{
        id = "oci-fnd-001-q092"
        domain = "Pricing, Support and Operations"
        subtopics = @("BYOL ในระดับพื้นฐาน")
        difficulty = "medium"
        type = "single"
        scenario = $true
        question = "An enterprise customer currently owns existing on-premises perpetual licenses for Oracle Database Enterprise Edition with active software support. They plan to migrate these database workloads to Oracle Base Database Service on OCI. Which licensing option allows the customer to apply their existing investment to reduce ongoing OCI subscription costs?"
        options = @(
            @{ id = "A"; text = "Bring Your Own License (BYOL)" },
            @{ id = "B"; text = "License Included (LI)" },
            @{ id = "C"; text = "Universal Credit Conversion (UCC)" },
            @{ id = "D"; text = "Open Source GNU Public Waiver" }
        )
        correct_answer = @("A")
        explanation = "Bring Your Own License (BYOL) ช่วยให้ลูกค้าสามารถนำไลเซนส์ซอฟต์แวร์ของ Oracle เดิมที่มีอยู่แล้วใน On-premises (เช่น Oracle Database หรือ Oracle Middleware) พร้อมสัญญาบำรุงรักษา (Software Support) มาปรับใช้บน OCI ได้ ทำให้จ่ายเฉพาะค่าโครงสร้างพื้นฐานคลาวด์ในราคาประหยัดกว่าการเช่าแบบรวมไลเซนส์ (License Included) อย่างมาก
- ตัวเลือก B (License Included) คือการจ่ายค่าเช่าแบบรวมค่าไลเซนส์ในบิล OCI เหมาะสำหรับผู้ที่ไม่มีไลเซนส์เดิม
- ตัวเลือก C และ D ไม่ใช่โมเดลไลเซนส์ของ OCI"
        tags = @("pricing", "byol", "licensing", "cost-saving", "scenarios")
        references = @(
            @{
                title = "Oracle Cloud Infrastructure BYOL"
                url = "https://docs.oracle.com/en-us/iaas/Content/Billing/Concepts/billingoverview.htm"
            }
        )
    },
    @{
        id = "oci-fnd-001-q093"
        domain = "Pricing, Support and Operations"
        subtopics = @("Cost Estimator, Cost Analysis และ budgets")
        difficulty = "medium"
        type = "single"
        scenario = $true
        question = "A finance manager needs to review historical cloud spending across the past six months, visualize spending trends, and filter the expenditure by specific compartments, services, and CostCenter defined tags. Which built-in OCI tool should the finance manager use?"
        options = @(
            @{ id = "A"; text = "OCI Cost Analysis" },
            @{ id = "B"; text = "OCI Service Limits" },
            @{ id = "C"; text = "OCI FastConnect Console" },
            @{ id = "D"; text = "OCI Cloud Shell" }
        )
        correct_answer = @("A")
        explanation = "OCI Cost Analysis เป็นเครื่องมือวิเคราะห์และแสดงผลภาพรวมค่าใช้จ่ายบน OCI Console ที่ช่วยให้ฝ่ายการเงินและผู้ดูแลระบบสามารถตรวจสอบประวัติการใช้จ่ายย้อนหลัง, ดูแนวโน้ม (Trends), และจัดกลุ่มหรือกรองข้อมูล (Filter & Group) ตาม Compartment, บริการ (Service), หรือ Defined Tags (เช่น CostCenter) ได้อย่างละเอียด
- ตัวเลือก B (Service Limits) ใช้ดูเพดานจำนวนทรัพยากร
- ตัวเลือก C (FastConnect) เป็นบริการเน็ตเวิร์ก
- ตัวเลือก D (Cloud Shell) เป็นเทอร์มินัลคำสั่ง"
        tags = @("pricing", "cost-analysis", "cost-governance", "scenarios")
        references = @(
            @{
                title = "Cost Analysis Overview"
                url = "https://docs.oracle.com/en-us/iaas/Content/Billing/Concepts/costanalysisoverview.htm"
            }
        )
    },
    @{
        id = "oci-fnd-001-q094"
        domain = "Pricing, Support and Operations"
        subtopics = @("Cost Estimator, Cost Analysis และ budgets")
        difficulty = "easy"
        type = "single"
        scenario = $false
        question = "What is the primary function of OCI Budgets?"
        options = @(
            @{ id = "A"; text = "Setting financial spending thresholds on compartments or cost-tracking tags and triggering automated email alerts when actual or forecasted spending exceeds a configured percentage." },
            @{ id = "B"; text = "Automatically shutting down production database servers when monthly billing cycles end." },
            @{ id = "C"; text = "Negotiating custom server hardware discount rates directly with Oracle sales executives." },
            @{ id = "D"; text = "Transferring corporate funds automatically between commercial banking institutions." }
        )
        correct_answer = @("A")
        explanation = "OCI Budgets ช่วยให้องค์กรสามารถกำหนดงบประมาณค่าใช้จ่าย (Spending thresholds) บน Compartment หรือ Cost-tracking Tags ได้ โดยสามารถตั้งเกณฑ์การแจ้งเตือน (Alert Rules) เช่น ส่งอีเมลแจ้งเตือนเมื่อยอดค่าใช้จ่ายจริง (Actual spend) หรือยอดคาดการณ์สิ้นเดือน (Forecasted spend) เกินเปอร์เซ็นต์ที่กำหนด (เช่น เกิน 80% หรือ 100%) เพื่อป้องกันค่างวดบานปลาย
- ตัวเลือก B ผิด เพราะ Budgets เป็นเพียงระบบแจ้งเตือน ไม่ได้สั่งปิดหรือทำลายเซิร์ฟเวอร์ฐานข้อมูล Production
- ตัวเลือก C และ D ไม่ใช่หน้าที่ของ OCI Budgets"
        tags = @("pricing", "budgets", "cost-governance", "alerts")
        references = @(
            @{
                title = "Budgets Overview"
                url = "https://docs.oracle.com/en-us/iaas/Content/Billing/Concepts/budgetsoverview.htm"
            }
        )
    },
    @{
        id = "oci-fnd-001-q095"
        domain = "Pricing, Support and Operations"
        subtopics = @("Cost Estimator, Cost Analysis และ budgets")
        difficulty = "hard"
        type = "single"
        scenario = $true
        question = "Before migrating an on-premises enterprise application to OCI, a solutions architect needs to model the proposed infrastructure architecture—including compute shapes, storage volumes, and load balancers—and generate an estimated monthly cost report for executive approval without deploying any live resources. Which tool is designed specifically for this pre-deployment planning?"
        options = @(
            @{ id = "A"; text = "OCI Cost Estimator" },
            @{ id = "B"; text = "OCI Usage Reports" },
            @{ id = "C"; text = "OCI Logging Service" },
            @{ id = "D"; text = "OCI Security Zones" }
        )
        correct_answer = @("A")
        explanation = "OCI Cost Estimator คือเครื่องมือจำลองและประเมินค่าใช้จ่ายบนเว็บเบราว์เซอร์ ที่ช่วยให้สถาปนิกและผู้บริหารสามารถวางแผนโครงสร้างพื้นฐานที่ต้องการ (เช่น สเปก Compute, ขนาด Block Storage, จำนวน Load Balancer) และคำนวณงบประมาณค่าใช้จ่ายรายเดือนโดยประมาณได้ล่วงหน้าก่อนที่จะมีการสร้างทรัพยากรจริงในระบบ
- ตัวเลือก B (Usage Reports) เป็นไฟล์ CSV รายงานการใช้ทรัพยากรจริงในอดีตที่เกิดขึ้นแล้ว
- ตัวเลือก C และ D ไม่ใช่เครื่องมือประเมินงบประมาณ"
        tags = @("pricing", "cost-estimator", "planning", "scenarios")
        references = @(
            @{
                title = "Cost Estimator"
                url = "https://docs.oracle.com/en-us/iaas/Content/Billing/Concepts/billingoverview.htm"
            }
        )
    },
    @{
        id = "oci-fnd-001-q096"
        domain = "Pricing, Support and Operations"
        subtopics = @("Free Tier ในระดับแนวคิด โดยไม่สร้างคำถามที่ผูกกับตัวเลขโปรโมชันซึ่งเปลี่ยนบ่อย")
        difficulty = "easy"
        type = "single"
        scenario = $false
        question = "What are the two distinct components that make up the Oracle Cloud Infrastructure Free Tier offering?"
        options = @(
            @{ id = "A"; text = "Always Free resources available indefinitely without expiration, plus a limited-time Free Trial credit with promotional credits to explore paid services." },
            @{ id = "B"; text = "Unlimited Bare Metal servers for 10 years, plus free physical hardware delivery to customer homes." },
            @{ id = "C"; text = "Free access to internal Oracle source code repositories, plus permanent free FastConnect 100 Gbps ports." },
            @{ id = "D"; text = "Temporary access to the OCI Console that automatically cancels the account after 7 days." }
        )
        correct_answer = @("A")
        explanation = "OCI Free Tier ประกอบด้วย 2 ส่วนสำคัญ ได้แก่:
1. Always Free: ทรัพยากรคลาวด์พื้นฐานที่อนุญาตให้ใช้งานได้ฟรีตลอดไปโดยไม่มีวันหมดอายุ (เช่น Autonomous Database ขนาดจำกัด, Compute Micro/Flex Shapes บางรุ่น, Storage บางส่วน)
2. Free Trial: เครดิตโปรโมชันสำหรับการทดลองใช้งานบริการต่าง ๆ ของ OCI ในช่วงเวลาเริ่มต้น (เช่น 30 วัน)
- ตัวเลือก B, C และ D ไม่ถูกต้องตามข้อเสนอของ OCI Free Tier"
        tags = @("pricing", "free-tier", "always-free", "free-trial")
        references = @(
            @{
                title = "Oracle Cloud Free Tier"
                url = "https://docs.oracle.com/en-us/iaas/Content/FreeTier/freetier_topic-Always_Free_Resources.htm"
            }
        )
    },
    @{
        id = "oci-fnd-001-q097"
        domain = "Pricing, Support and Operations"
        subtopics = @("Support plans และการขอ technical support")
        difficulty = "medium"
        type = "single"
        scenario = $true
        question = "An enterprise is running a production e-commerce application on OCI. A critical failure occurs where the entire production system is down, preventing thousands of customers from making purchases and causing severe, immediate financial loss to the business. When opening a technical Support Request (SR) in My Oracle Support, which Severity level must be selected?"
        options = @(
            @{ id = "A"; text = "Severity 1 (Critical complete loss of service with catastrophic business impact)" },
            @{ id = "B"; text = "Severity 2 (Severe loss of service where operations can continue in a restricted manner)" },
            @{ id = "C"; text = "Severity 3 (Minor loss of service or non-critical issue)" },
            @{ id = "D"; text = "Severity 4 (General guidance, technical inquiry, or cosmetic defect)" }
        )
        correct_answer = @("A")
        explanation = "ระดับความรุนแรงของ Support Request (SR) บน My Oracle Support (MOS):
- Severity 1 (Critical): สำหรับกรณีที่ระบบ Production ทั้งหมดล่มโดยสิ้นเชิง (Complete loss of service) ทำให้ธุรกิจไม่สามารถดำเนินต่อไปได้ และก่อให้เกิดผลกระทบร้ายแรงในทันที ซึ่งทีมสนับสนุนของ Oracle จะทำงานแก้ไขตลอด 24 ชั่วโมงแบบฉุกเฉิน
- Severity 2: การทำงานเสียหายรุนแรงแต่ยังพอประคับประคองดำเนินงานได้บางส่วน
- Severity 3: ปัญหาเล็กน้อย ระบบส่วนใหญ่ยังทำงานได้ปกติ
- Severity 4: คำถามทั่วไป หรือการสอบถามข้อมูลการใช้งาน"
        tags = @("support", "severity-levels", "my-oracle-support", "incident-management")
        references = @(
            @{
                title = "Contacting Oracle Support"
                url = "https://docs.oracle.com/en-us/iaas/Content/GSG/Tasks/contactingsupport.htm"
            }
        )
    },
    @{
        id = "oci-fnd-001-q098"
        domain = "Pricing, Support and Operations"
        subtopics = @("SLA และ service health ในระดับแนวคิด")
        difficulty = "hard"
        type = "single"
        scenario = $true
        question = "Unlike many other cloud providers that provide Service Level Agreements (SLAs) exclusively for service availability (uptime), Oracle Cloud Infrastructure provides a comprehensive, financially backed SLA covering three distinct pillars. What are these three core pillars of OCI's Service Level Agreement?"
        options = @(
            @{ id = "A"; text = "Availability (uptime), Manageability (ability to manage, monitor, and modify resources via APIs), and Performance (consistent guaranteed network and storage throughput)" },
            @{ id = "B"; text = "Cost Reduction, Hardware Resale Value, and Office Electricity Conservation" },
            @{ id = "C"; text = "Software Debugging, Mainframe Emulation, and Free Training Certification" },
            @{ id = "D"; text = "Data Compression, Physical Courier Delivery, and Credit Score Maintenance" }
        )
        correct_answer = @("A")
        explanation = "จุดเด่นที่แตกต่างของ OCI คือการให้ข้อตกลงระดับการบริการ (SLA) ที่มีผลผูกพันทางการเงินครอบคลุมครบทั้ง 3 มิติหลัก ได้แก่:
1. Availability SLA: รับประกันความพร้อมใช้งานของระบบ (Uptime)
2. Manageability SLA: รับประกันความสามารถในการบริหารจัดการ ตรวจสอบ และสั่งการทรัพยากรผ่าน Console/APIs ได้อย่างต่อเนื่อง
3. Performance SLA: รับประกันประสิทธิภาพการทำงานที่สม่ำเสมอของระบบเครือข่ายและสตอเรจตามที่กำหนดไว้
- ตัวเลือก B, C และ D ไม่ใช่องค์ประกอบของ OCI SLA"
        tags = @("pricing", "sla", "availability", "manageability", "performance")
        references = @(
            @{
                title = "Oracle Cloud Infrastructure SLAs"
                url = "https://docs.oracle.com/en-us/iaas/Content/General/Concepts/sla.htm"
            }
        )
    },
    @{
        id = "oci-fnd-001-q099"
        domain = "Pricing, Support and Operations"
        subtopics = @("Cost governance, tagging, quotas และ limits")
        difficulty = "medium"
        type = "multiple"
        scenario = $false
        question = "Which TWO OCI governance mechanisms directly enable cloud financial administrators to monitor, manage, and prevent uncontrolled infrastructure spending across multiple departments? (Choose TWO)"
        options = @(
            @{ id = "A"; text = "Compartment Quotas that strictly cap resource allocations per compartment via declarative policies" },
            @{ id = "B"; text = "OCI Budgets combined with alert rules that notify administrators when actual or forecasted costs cross spending thresholds" },
            @{ id = "C"; text = "Dynamic Routing Gateways attached to private subnets" },
            @{ id = "D"; text = "Pre-Authenticated Requests issued on root compartments" },
            @{ id = "E"; text = "Custom Linux kernel modifications installed on bare metal instances" }
        )
        correct_answer = @("A", "B")
        explanation = "เครื่องมือควบคุมและตรวจสอบค่าใช้จ่าย (Cost Governance) บน OCI ได้แก่:
- (A) Compartment Quotas: นโยบายควบคุมเพดานการจัดสรรทรัพยากรในแต่ละ Compartment เพื่อป้องกันไม่ให้ทีมสร้างทรัพยากรเกินที่กำหนด
- (B) OCI Budgets: เครื่องมือกำหนดงบประมาณพร้อมกฎแจ้งเตือนทางอีเมลเมื่อยอดการใช้งานจริงหรือยอดคาดการณ์สิ้นเดือนเกินเกณฑ์ที่ตั้งไว้
- ตัวเลือก C, D, และ E เป็นบริการด้านเน็ตเวิร์ก สตอเรจ และระบบปฏิบัติการ ไม่ใช่เครื่องมือด้าน Cost Governance"
        tags = @("pricing", "cost-governance", "budgets", "compartment-quotas")
        references = @(
            @{
                title = "Cost Management Overview"
                url = "https://docs.oracle.com/en-us/iaas/Content/Billing/Concepts/costmanagementoverview.htm"
            }
        )
    },
    @{
        id = "oci-fnd-001-q100"
        domain = "Pricing, Support and Operations"
        subtopics = @("Support plans และการขอ technical support")
        difficulty = "hard"
        type = "multiple"
        scenario = $true
        question = "A cloud operations administrator needs to open a technical support request for an unexpected database provisioning failure in their company's production OCI tenancy. Which TWO prerequisites are required to successfully submit technical support tickets through My Oracle Support (MOS)? (Choose TWO)"
        options = @(
            @{ id = "A"; text = "The tenancy must be associated with a paid account subscription (Pay As You Go or Universal Credits), as technical support is not provided for Free Tier accounts." },
            @{ id = "B"; text = "The administrator's My Oracle Support account must be linked to the tenancy's Customer Support Identifier (CSI)." },
            @{ id = "C"; text = "The tenancy must be operating inside a US Government Realm (OC2) exclusively." },
            @{ id = "D"; text = "All compute instances in the tenancy must be powered off before opening any support ticket." },
            @{ id = "E"; text = "The customer must hold at least three active Oracle Cloud Certified Professional certifications." }
        )
        correct_answer = @("A", "B")
        explanation = "เงื่อนไขสำคัญในการเปิด Technical Support Request บน My Oracle Support (MOS):
- (A) บัญชี Tenancy จะต้องเป็นบัญชีแบบชำระเงิน (Paid Account เช่น Pay As You Go หรือ Universal Credits) เนื่องจากบัญชีประเภท Free Tier จะไม่ได้รับสิทธิ์เปิด Technical Support Ticket (มีเพียงการสนับสนุนผ่าน Community Forum เท่านั้น)
- (B) ผู้ใช้งานจะต้องเชื่อมโยงบัญชี My Oracle Support เข้ากับ Customer Support Identifier (CSI) ของ Tenancy นั้นอย่างถูกต้อง
- ตัวเลือก C, D, และ E ไม่ใช่ข้อกำหนดในการเปิด Support Request"
        tags = @("support", "my-oracle-support", "csi", "paid-tier", "scenarios")
        references = @(
            @{
                title = "Contacting Oracle Support"
                url = "https://docs.oracle.com/en-us/iaas/Content/GSG/Tasks/contactingsupport.htm"
            }
        )
    }
)
