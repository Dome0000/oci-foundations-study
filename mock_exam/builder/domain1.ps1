# Domain 1: Cloud Concepts (15 questions: Q001 - Q015)
# 12 single, 3 multiple (Q008, Q013, Q015)
# Difficulty: 4 easy, 7 medium, 4 hard
# Scenarios: 8 true, 7 false

$domain1 = @(
    @{
        id = "oci-fnd-001-q001"
        domain = "Cloud Concepts"
        subtopics = @("Cloud computing characteristics")
        difficulty = "easy"
        type = "single"
        scenario = $false
        question = "According to standard cloud computing definitions (such as NIST SP 800-145), which essential characteristic describes a consumer's ability to provision computing capabilities, such as server processing time and network storage, unilaterally and automatically without human interaction from the service provider?"
        options = @(
            @{ id = "A"; text = "On-demand self-service" },
            @{ id = "B"; text = "Broad network access" },
            @{ id = "C"; text = "Resource pooling" },
            @{ id = "D"; text = "Measured service" }
        )
        correct_answer = @("A")
        explanation = "On-demand self-service คือคุณลักษณะสำคัญของ Cloud Computing ที่ผู้ใช้งานสามารถสั่งเปิดหรือจัดสรรทรัพยากร (เช่น Compute, Storage, Network) ได้ด้วยตนเองแบบอัตโนมัติทันทีที่ต้องการ โดยไม่ต้องติดต่อหรือรอการดำเนินการจากเจ้าหน้าที่ของผู้ให้บริการ (Human interaction)
- ตัวเลือก B (Broad network access) คือการเข้าถึงบริการผ่านเครือข่ายด้วยอุปกรณ์และแพลตฟอร์มที่หลากหลาย
- ตัวเลือก C (Resource pooling) คือการรวมทรัพยากรของผู้ให้บริการเพื่อแชร์ให้ผู้ใช้หลายรายผ่านโมเดล Multi-tenant
- ตัวเลือก D (Measured service) คือระบบวัดและควบคุมปริมาณการใช้ทรัพยากรเพื่อคิดค่าบริการตามจริง"
        tags = @("cloud-concepts", "nist", "characteristics")
        references = @(
            @{
                title = "Oracle Cloud Infrastructure Concepts"
                url = "https://docs.oracle.com/en-us/iaas/Content/General/Concepts/cloudconcepts.htm"
            }
        )
    },
    @{
        id = "oci-fnd-001-q002"
        domain = "Cloud Concepts"
        subtopics = @("IaaS, PaaS, SaaS")
        difficulty = "easy"
        type = "single"
        scenario = $false
        question = "In which cloud service delivery model does the cloud provider manage the physical hardware, virtualization, operating system, middleware, and database runtime, allowing customers to focus strictly on deploying their custom code and managing application data?"
        options = @(
            @{ id = "A"; text = "Platform as a Service (PaaS)" },
            @{ id = "B"; text = "Infrastructure as a Service (IaaS)" },
            @{ id = "C"; text = "Software as a Service (SaaS)" },
            @{ id = "D"; text = "Bare Metal as a Service (BMaaS)" }
        )
        correct_answer = @("A")
        explanation = "Platform as a Service (PaaS) เป็นโมเดลที่ผู้ให้บริการคลาวด์ดูแลจัดการโครงสร้างพื้นฐานระดับล่างทั้งหมด รวมถึงระบบปฏิบัติการ (OS), Middleware, และ Runtime Environment ทำให้ผู้พัฒนาสามารถมุ่งเน้นไปที่การเขียนโค้ดและจัดการข้อมูลของแอปพลิเคชันโดยตรง
- ตัวเลือก B (IaaS) และ D (BMaaS) ผู้ใช้ยังคงต้องติดตั้งและดูแลระบบปฏิบัติการและแพตช์ซอฟต์แวร์เอง
- ตัวเลือก C (SaaS) ผู้ให้บริการดูแลทั้งหมดรวมถึงตัวแอปพลิเคชัน ผู้ใช้เพียงแค่ใช้งานซอฟต์แวร์สำเร็จรูป"
        tags = @("cloud-concepts", "service-models", "paas")
        references = @(
            @{
                title = "Oracle Cloud Infrastructure Concepts"
                url = "https://docs.oracle.com/en-us/iaas/Content/General/Concepts/cloudconcepts.htm"
            }
        )
    },
    @{
        id = "oci-fnd-001-q003"
        domain = "Cloud Concepts"
        subtopics = @("IaaS, PaaS, SaaS")
        difficulty = "medium"
        type = "single"
        scenario = $true
        question = "A mid-sized enterprise is migrating its legacy human resources and payroll operations to the cloud. Company leadership mandates that internal IT staff must have zero responsibility for installing software, applying operating system security patches, managing database backups, or maintaining server infrastructure. Which cloud delivery model directly satisfies this mandate?"
        options = @(
            @{ id = "A"; text = "Software as a Service (SaaS)" },
            @{ id = "B"; text = "Infrastructure as a Service (IaaS)" },
            @{ id = "C"; text = "Platform as a Service (PaaS)" },
            @{ id = "D"; text = "Container as a Service (CaaS)" }
        )
        correct_answer = @("A")
        explanation = "Software as a Service (SaaS) เช่น Oracle Fusion Cloud HCM เป็นบริการแอปพลิเคชันสำเร็จรูปบนคลาวด์ที่ผู้ให้บริการดูแลจัดการทุกอย่าง ตั้งแต่โครงสร้างพื้นฐาน ระบบปฏิบัติการ ฐานข้อมูล ไปจนถึงการอัปเดตและบำรุงรักษาซอฟต์แวร์ ผู้ใช้สามารถเข้าใช้งานผ่านเว็บเบราว์เซอร์ได้ทันทีโดยที่ฝ่าย IT ไม่ต้องดูแลเซิร์ฟเวอร์หรือซอฟต์แวร์ใด ๆ
- ตัวเลือก B (IaaS) ฝ่าย IT ต้องจัดการระบบปฏิบัติการและการติดตั้งซอฟต์แวร์เอง
- ตัวเลือก C (PaaS) และ D (CaaS) ฝ่าย IT ยังต้องพัฒนาและบำรุงรักษาโค้ดของแอปพลิเคชันเอง"
        tags = @("cloud-concepts", "saas", "scenarios")
        references = @(
            @{
                title = "Oracle Cloud Infrastructure Concepts"
                url = "https://docs.oracle.com/en-us/iaas/Content/General/Concepts/cloudconcepts.htm"
            }
        )
    },
    @{
        id = "oci-fnd-001-q004"
        domain = "Cloud Concepts"
        subtopics = @("Scalability, elasticity, high availability, fault tolerance")
        difficulty = "medium"
        type = "single"
        scenario = $true
        question = "An online ticketing retailer experiences massive surges in website traffic that occur unpredictably during celebrity concert ticket releases lasting between 30 and 90 minutes. Once sales conclude, traffic drops back to baseline. Which cloud architectural characteristic enables the infrastructure to automatically expand compute instances during the surge and contract immediately after to minimize operational costs?"
        options = @(
            @{ id = "A"; text = "Elasticity" },
            @{ id = "B"; text = "Fault Tolerance" },
            @{ id = "C"; text = "Vertical Scalability" },
            @{ id = "D"; text = "Disaster Recovery" }
        )
        correct_answer = @("A")
        explanation = "Elasticity (ความยืดหยุ่น) คือคุณสมบัติของระบบคลาวด์ในการขยายขนาด (Scale-out) และลดขนาด (Scale-in) ทรัพยากรการประมวลผลได้โดยอัตโนมัติตามปริมาณความต้องการใช้งานจริงที่เปลี่ยนแปลงอย่างรวดเร็ว เพื่อรองรับโหลดงานได้อย่างราบรื่นและลดต้นทุนเมื่อความต้องการลดลง
- ตัวเลือก B (Fault Tolerance) คือความสามารถของระบบในการทำงานได้อย่างต่อเนื่องแม้มีอุปกรณ์ขัดข้อง
- ตัวเลือก C (Vertical Scalability) คือการปรับเพิ่มขนาด CPU/RAM ของเครื่องเดิม ซึ่งมักต้องหยุดการทำงานชั่วคราวและไม่ยืดหยุ่นพอสำหรับทราฟฟิกฉับพลัน
- ตัวเลือก D (Disaster Recovery) คือกระบวนการกู้คืนระบบจากภัยพิบัติ"
        tags = @("cloud-concepts", "elasticity", "scalability")
        references = @(
            @{
                title = "Oracle Cloud Infrastructure Concepts"
                url = "https://docs.oracle.com/en-us/iaas/Content/General/Concepts/cloudconcepts.htm"
            }
        )
    },
    @{
        id = "oci-fnd-001-q005"
        domain = "Cloud Concepts"
        subtopics = @("Scalability, elasticity, high availability, fault tolerance")
        difficulty = "easy"
        type = "single"
        scenario = $false
        question = "What is the primary operational difference between High Availability (HA) and Fault Tolerance (FT) in cloud architecture design?"
        options = @(
            @{ id = "A"; text = "Fault Tolerance guarantees continuous operation with zero downtime by using redundant mirrored hardware, whereas High Availability aims for maximum uptime with minimal acceptable downtime during automated failover." },
            @{ id = "B"; text = "High Availability guarantees zero downtime under all circumstances, whereas Fault Tolerance accepts hours of service degradation." },
            @{ id = "C"; text = "Fault Tolerance requires multi-region active-active deployments, while High Availability is strictly limited to a single physical server." },
            @{ id = "D"; text = "High Availability is only applicable to database software, whereas Fault Tolerance applies only to public networking." }
        )
        correct_answer = @("A")
        explanation = "Fault Tolerance (FT) มุ่งเน้นการทำงานได้อย่างต่อเนื่อง 100% โดยไม่มีการหยุดชะงัก (Zero downtime) แม้จะมีอุปกรณ์ฮาร์ดแวร์เสียหาย โดยใช้ส่วนประกอบที่ซ้ำซ้อนกันอย่างสมบูรณ์ ในขณะที่ High Availability (HA) มุ่งเน้นการทำให้ระบบพร้อมใช้งานได้มากที่สุดตามเกณฑ์ที่ยอมรับได้ (เช่น 99.99%) โดยอาจมีช่วงเวลาหยุดชะงักสั้น ๆ ระหว่างที่ระบบทำการ Failover อัตโนมัติ
- ตัวเลือก B อธิบายสลับความหมายกัน FT ต่างหากที่เน้น zero downtime
- ตัวเลือก C และ D ให้คำจำกัดความผิดพลาด เพราะทั้ง HA และ FT สามารถนำไปปรับใช้ได้ทั้งระดับ Region, ศูนย์ข้อมูล และฮาร์ดแวร์"
        tags = @("cloud-concepts", "high-availability", "fault-tolerance")
        references = @(
            @{
                title = "Oracle Cloud Infrastructure Concepts"
                url = "https://docs.oracle.com/en-us/iaas/Content/General/Concepts/cloudconcepts.htm"
            }
        )
    },
    @{
        id = "oci-fnd-001-q006"
        domain = "Cloud Concepts"
        subtopics = @("CapEx และ OpEx")
        difficulty = "medium"
        type = "single"
        scenario = $true
        question = "A Chief Financial Officer (CFO) is evaluating a proposal to transition the company's legacy data center infrastructure to Oracle Cloud Infrastructure (OCI). From a financial management perspective, how does this migration transform the company's IT spending structure?"
        options = @(
            @{ id = "A"; text = "It replaces large upfront Capital Expenditure (CapEx) for physical facilities and hardware with ongoing Operational Expenditure (OpEx) based on consumption." },
            @{ id = "B"; text = "It eliminates all Operational Expenditure (OpEx) by capitalizing all cloud services as 10-year fixed corporate assets." },
            @{ id = "C"; text = "It increases Capital Expenditure (CapEx) because customers must purchase the physical servers hosted within Oracle data centers." },
            @{ id = "D"; text = "It mandates a single upfront lump-sum payment that prevents future variable operational costs." }
        )
        correct_answer = @("A")
        explanation = "การย้ายระบบสู่คลาวด์ช่วยเปลี่ยนโมเดลทางการเงินจาก Capital Expenditure (CapEx) ซึ่งเป็นเงินลงทุนก้อนใหญ่ล่วงหน้าในการซื้อเซิร์ฟเวอร์ อุปกรณ์เครือข่าย และการสร้างดาต้าเซ็นเตอร์ ไปเป็น Operational Expenditure (OpEx) ซึ่งเป็นค่าใช้จ่ายในการดำเนินงานที่จ่ายตามปริมาณการใช้งานจริง (Pay-per-use) ทำให้องค์กรประหยัดงบลงทุนก้อนแรกและมีความยืดหยุ่นทางการเงินสูงขึ้น
- ตัวเลือก B ผิด คลาวด์ไม่ได้ตัด OpEx ออก แต่เปลี่ยน CapEx ให้กลายเป็น OpEx
- ตัวเลือก C ผิด ลูกค้าไม่ต้องซื้อฮาร์ดแวร์จริงในดาต้าเซ็นเตอร์ของ Oracle
- ตัวเลือก D ผิด คลาวด์คิดค่าบริการแบบยืดหยุ่นตามการใช้งาน ไม่ได้บังคับจ่ายเงินก้อนคงที่ก้อนเดียว"
        tags = @("cloud-concepts", "capex", "opex", "economics")
        references = @(
            @{
                title = "Oracle Cloud Infrastructure Concepts"
                url = "https://docs.oracle.com/en-us/iaas/Content/General/Concepts/cloudconcepts.htm"
            }
        )
    },
    @{
        id = "oci-fnd-001-q007"
        domain = "Cloud Concepts"
        subtopics = @("Shared responsibility model")
        difficulty = "medium"
        type = "single"
        scenario = $false
        question = "Under the Cloud Shared Security Responsibility Model for Infrastructure as a Service (IaaS), which security domain is universally managed by the cloud service provider (Oracle) rather than the customer?"
        options = @(
            @{ id = "A"; text = "Physical facility security, hardware decommissioning, and hypervisor infrastructure" },
            @{ id = "B"; text = "Customer IAM user account lifecycles and role-based access controls" },
            @{ id = "C"; text = "Operating system patch management and guest firewall configuration" },
            @{ id = "D"; text = "Customer data classification and database record encryption policies" }
        )
        correct_answer = @("A")
        explanation = "ตามแบบจำลองความรับผิดชอบร่วมกัน (Shared Security Responsibility Model) ในรูปแบบ IaaS ผู้ให้บริการคลาวด์ (Oracle) มีหน้าที่รับผิดชอบ 'Security of the Cloud' ซึ่งรวมถึงความปลอดภัยทางกายภาพของศูนย์ข้อมูล, การทำลายฮาร์ดแวร์ที่หมดอายุอย่างปลอดภัย, ฮาร์ดแวร์เซิร์ฟเวอร์จริง และระบบเวอร์ชวลไลเซชัน (Hypervisor)
- ตัวเลือก B, C, และ D เป็นหน้าที่ของลูกค้า ('Security in the Cloud') ได้แก่ การจัดการผู้ใช้ IAM, การลงแพตช์ OS บน VM และการจัดหมวดหมู่รวมถึงเข้ารหัสข้อมูลตนเอง"
        tags = @("cloud-concepts", "shared-responsibility", "security")
        references = @(
            @{
                title = "Overview of Security in OCI"
                url = "https://docs.oracle.com/en-us/iaas/Content/Security/Reference/security_overview.htm"
            }
        )
    },
    @{
        id = "oci-fnd-001-q008"
        domain = "Cloud Concepts"
        subtopics = @("Public, private, hybrid และ multicloud")
        difficulty = "medium"
        type = "multiple"
        scenario = $false
        question = "An enterprise is planning a Hybrid Cloud deployment strategy connecting its on-premises environment to Oracle Cloud Infrastructure. Which TWO business and technical benefits are directly provided by this architecture? (Choose TWO)"
        options = @(
            @{ id = "A"; text = "Retaining sensitive regulatory workloads in on-premises facilities while utilizing public cloud scalability for burst processing" },
            @{ id = "B"; text = "Enabling phased, low-risk migration of enterprise applications without requiring an all-at-once data center cutover" },
            @{ id = "C"; text = "Completely eliminating all network latency between on-premises databases and cloud web tiers" },
            @{ id = "D"; text = "Transferring all physical maintenance of on-premises cooling systems and UPS generators to Oracle" },
            @{ id = "E"; text = "Automatic conversion of legacy proprietary on-premises mainframe software into modern cloud-native containers" }
        )
        correct_answer = @("A", "B")
        explanation = "ประโยชน์สำคัญของโมเดล Hybrid Cloud ได้แก่:
- (A) สามารถเก็บเวิร์กโหลดที่ต้องปฏิบัติตามกฎระเบียบเข้มงวดไว้ในดาต้าเซ็นเตอร์ของตนเอง พร้อมทั้งใช้ความยืดหยุ่นของพับลิกคลาวด์ขยายการประมวลผลช่วงโหลดสูง (Cloud Bursting)
- (B) ช่วยให้องค์กรสามารถทยอยย้ายแอปพลิเคชันขึ้นสู่คลาวด์ทีละขั้นตอนได้อย่างปลอดภัย ลดความเสี่ยงจากการตัดถ่ายระบบทั้งหมดในคราวเดียว
- ตัวเลือก C ผิด เนื่องจากการเชื่อมต่อข้ามไซต์ย่อมมี Network Latency เสมอ
- ตัวเลือก D ผิด เพราะอุปกรณ์ On-premises ยังคงเป็นหน้าที่ขององค์กรในการดูแลรักษา
- ตัวเลือก E ผิด เพราะระบบไม่ได้ทำการแปลงโปรแกรมเก่าแบบอัตโนมัติให้เอง"
        tags = @("cloud-concepts", "hybrid-cloud", "deployment-models")
        references = @(
            @{
                title = "Oracle Cloud Infrastructure Concepts"
                url = "https://docs.oracle.com/en-us/iaas/Content/General/Concepts/cloudconcepts.htm"
            }
        )
    },
    @{
        id = "oci-fnd-001-q009"
        domain = "Cloud Concepts"
        subtopics = @("Disaster recovery เบื้องต้น")
        difficulty = "hard"
        type = "single"
        scenario = $true
        question = "A financial services institution defines its disaster recovery criteria for its core transactional database: following an unexpected catastrophic failure, the database service must be restored and operational within 2 hours, and data loss must not exceed 15 minutes of transactions. Which terms correctly categorize these two operational thresholds?"
        options = @(
            @{ id = "A"; text = "Recovery Time Objective (RTO) = 2 hours; Recovery Point Objective (RPO) = 15 minutes" },
            @{ id = "B"; text = "Recovery Point Objective (RPO) = 2 hours; Recovery Time Objective (RTO) = 15 minutes" },
            @{ id = "C"; text = "Mean Time to Repair (MTTR) = 15 minutes; Service Level Agreement (SLA) = 2 hours" },
            @{ id = "D"; text = "Maximum Tolerable Downtime (MTD) = 15 minutes; Work Recovery Time (WRT) = 2 hours" }
        )
        correct_answer = @("A")
        explanation = "คำจำกัดความมาตรฐานของ Disaster Recovery:
- Recovery Time Objective (RTO) คือระยะเวลาสูงสุดที่ยอมรับได้ในการกู้คืนระบบให้กลับมาทำงานได้หลังเกิดเหตุขัดข้อง (ในโจทย์คือไม่เกิน 2 ชั่วโมง)
- Recovery Point Objective (RPO) คือจุดเวลาย้อนหลังสูงสุดของข้อมูลที่ยอมรับการสูญหายได้ (ในโจทย์คือข้อมูลไม่เกิน 15 นาที)
- ตัวเลือก B สลับความหมายระหว่าง RTO และ RPO
- ตัวเลือก C และ D ไม่สอดคล้องกับคำนิยามของเป้าหมายการกู้คืนและระยะเวลาสูญหายของข้อมูล"
        tags = @("cloud-concepts", "disaster-recovery", "rto", "rpo")
        references = @(
            @{
                title = "Oracle Cloud Infrastructure Concepts"
                url = "https://docs.oracle.com/en-us/iaas/Content/General/Concepts/cloudconcepts.htm"
            }
        )
    },
    @{
        id = "oci-fnd-001-q010"
        domain = "Cloud Concepts"
        subtopics = @("Public, private, hybrid และ multicloud")
        difficulty = "hard"
        type = "single"
        scenario = $true
        question = "A global enterprise runs its mission-critical Oracle Autonomous Database on Oracle Cloud Infrastructure, while running its machine learning pipelines on Google Cloud Platform and hosting customer-facing mobile APIs on Microsoft Azure. What is this cloud deployment model called, and what is its main strategic advantage?"
        options = @(
            @{ id = "A"; text = "Multicloud architecture; it allows the enterprise to leverage best-of-breed services and mitigates vendor lock-in risk." },
            @{ id = "B"; text = "Private Cloud architecture; it guarantees that no public internet backbones are ever utilized." },
            @{ id = "C"; text = "Community Cloud architecture; it restricts infrastructure sharing to organizations within the same industry vertical." },
            @{ id = "D"; text = "Single-tenant IaaS architecture; it ensures a single management console operates all external clouds." }
        )
        correct_answer = @("A")
        explanation = "Multicloud architecture คือการนำบริการจากผู้ให้บริการพับลิกคลาวด์หลายรายมาใช้ร่วมกันในสถาปัตยกรรมขององค์กร (เช่น ใช้ Oracle Database บน OCI ร่วมกับ ML บน GCP และ Web บน Azure) ประโยชน์หลักคือการเลือกใช้บริการที่ดีที่สุดของแต่ละค่าย (Best-of-breed) และลดความเสี่ยงจากการผูกขาดกับผู้ให้บริการเพียงรายเดียว (Vendor lock-in)
- ตัวเลือก B ไม่ใช่ Private Cloud เพราะใช้บริการคลาวด์สาธารณะ
- ตัวเลือก C (Community Cloud) คือคลาวด์ที่แชร์กันเฉพาะกลุ่มองค์กรที่มีพันธกิจร่วมกัน
- ตัวเลือก D ผิด เพราะแต่ละคลาวด์มีคอนโซลแยกกัน ไม่ใช่ Single-tenant IaaS"
        tags = @("cloud-concepts", "multicloud", "architecture")
        references = @(
            @{
                title = "Oracle Cloud Infrastructure Concepts"
                url = "https://docs.oracle.com/en-us/iaas/Content/General/Concepts/cloudconcepts.htm"
            }
        )
    },
    @{
        id = "oci-fnd-001-q011"
        domain = "Cloud Concepts"
        subtopics = @("Cloud computing characteristics")
        difficulty = "easy"
        type = "single"
        scenario = $false
        question = "Which characteristic of cloud computing allows consumers to rapidly deploy and scale IT environments across multiple continents within minutes using code and automated APIs, dramatically reducing time-to-market for new products?"
        options = @(
            @{ id = "A"; text = "Agility and Speed" },
            @{ id = "B"; text = "Fixed Capacity Provisioning" },
            @{ id = "C"; text = "Hardware Depreciation Cycles" },
            @{ id = "D"; text = "Perpetual Physical Asset Licensing" }
        )
        correct_answer = @("A")
        explanation = "Agility (ความคล่องตัว) และ Speed (ความรวดเร็ว) ช่วยให้องค์กรสามารถสร้าง ทดสอบ และเริ่มใช้งานสภาพแวดล้อมระบบไอทีขนาดใหญ่ข้ามทวีปได้ในเวลาเพียงไม่กี่นาทีผ่าน API และโค้ดอัตโนมัติ ซึ่งลดระยะเวลาในการนำผลิตภัณฑ์ใหม่ออกสู่ตลาด (Time-to-market) เมื่อเทียบกับการจัดซื้อฮาร์ดแวร์แบบเดิมที่ต้องใช้เวลาหลายเดือน
- ตัวเลือก B, C และ D เป็นข้อจำกัดและลักษณะของการลงทุนด้านไอทีในดาต้าเซ็นเตอร์แบบดั้งเดิม (On-premises)"
        tags = @("cloud-concepts", "agility", "characteristics")
        references = @(
            @{
                title = "Oracle Cloud Infrastructure Concepts"
                url = "https://docs.oracle.com/en-us/iaas/Content/General/Concepts/cloudconcepts.htm"
            }
        )
    },
    @{
        id = "oci-fnd-001-q012"
        domain = "Cloud Concepts"
        subtopics = @("Public, private, hybrid และ multicloud")
        difficulty = "medium"
        type = "single"
        scenario = $true
        question = "A national government entity requires completely dedicated compute and storage infrastructure housed behind their own secured perimeter to satisfy national security data sovereignty laws, with zero sharing of physical hardware with external commercial entities. Which deployment model satisfies this requirement?"
        options = @(
            @{ id = "A"; text = "Private Cloud (or Dedicated Region / Cloud@Customer)" },
            @{ id = "B"; text = "Public Multi-tenant Cloud" },
            @{ id = "C"; text = "Hybrid Bursting Public Cloud" },
            @{ id = "D"; text = "Shared Commercial Cloud" }
        )
        correct_answer = @("A")
        explanation = "Private Cloud หรือโซลูชันอย่าง OCI Dedicated Region / OCI Compute Cloud@Customer เป็นรูปแบบการติดตั้งที่ฮาร์ดแวร์และโครงสร้างพื้นฐานทั้งหมดถูกจัดสรรให้แก่องค์กรเดียวโดยเฉพาะ (Dedicated/Single-tenant) โดยสามารถติดตั้งอยู่ภายในศูนย์ข้อมูลของลูกค้าเองเพื่อตอบสนองกฎหมายความมั่นคงแห่งชาติและการแยกขาดทางกายภาพ
- ตัวเลือก B และ D (Public/Shared) มีการแชร์ฮาร์ดแวร์ร่วมกับลูกค้ารายอื่น จึงไม่ผ่านข้อกำหนดการแยกขาด
- ตัวเลือก C มีการส่งเวิร์กโหลดออกไปยังพับลิกคลาวด์ จึงไม่ตรงกับความต้องการของโจทย์"
        tags = @("cloud-concepts", "private-cloud", "cloud-at-customer")
        references = @(
            @{
                title = "Oracle Cloud Infrastructure Concepts"
                url = "https://docs.oracle.com/en-us/iaas/Content/General/Concepts/cloudconcepts.htm"
            }
        )
    },
    @{
        id = "oci-fnd-001-q013"
        domain = "Cloud Concepts"
        subtopics = @("Shared responsibility model")
        difficulty = "medium"
        type = "multiple"
        scenario = $false
        question = "Under the OCI Shared Security Responsibility Model for an Infrastructure as a Service (IaaS) deployment, which TWO tasks are strictly the responsibility of the customer? (Choose TWO)"
        options = @(
            @{ id = "A"; text = "Applying operating system security patches to compute virtual machine instances" },
            @{ id = "B"; text = "Configuring ingress and egress firewall rules in Network Security Groups and Security Lists" },
            @{ id = "C"; text = "Upgrading physical switch firmware in Oracle data center networking racks" },
            @{ id = "D"; text = "Replacing failed physical hard drives in hypervisor storage arrays" },
            @{ id = "E"; text = "Maintaining backup power generators and diesel fuel supplies for data centers" }
        )
        correct_answer = @("A", "B")
        explanation = "ในโมเดล IaaS ความรับผิดชอบของลูกค้าได้แก่:
- (A) การอัปเดตและลงแพตช์ความปลอดภัยให้กับระบบปฏิบัติการ (Guest OS) บน Compute Instance
- (B) การกำหนดกฎไฟร์วอลล์ทางเครือข่าย (Security Lists และ Network Security Groups) สำหรับควบคุมทราฟฟิกเข้าออก
- ตัวเลือก C, D, และ E เป็นหน้าที่ของ Oracle ในฐานะผู้ให้บริการคลาวด์ ซึ่งดูแลโครงสร้างพื้นฐานทางกายภาพ ฮาร์ดแวร์ และสิ่งอำนวยความสะดวกในศูนย์ข้อมูล"
        tags = @("cloud-concepts", "shared-responsibility", "iaas")
        references = @(
            @{
                title = "Overview of Security in OCI"
                url = "https://docs.oracle.com/en-us/iaas/Content/Security/Reference/security_overview.htm"
            }
        )
    },
    @{
        id = "oci-fnd-001-q014"
        domain = "Cloud Concepts"
        subtopics = @("Disaster recovery เบื้องต้น")
        difficulty = "hard"
        type = "single"
        scenario = $true
        question = "An organization is evaluating disaster recovery strategies for its web application tier. They consider a 'Warm Standby' strategy versus a 'Pilot Light' strategy. What is the key difference between these two approaches?"
        options = @(
            @{ id = "A"; text = "A Warm Standby maintains a scaled-down but fully functional copy of all environment tiers running continuously, whereas a Pilot Light keeps only critical core data services replicated while application servers remain completely unprovisioned until disaster strikes." },
            @{ id = "B"; text = "A Pilot Light runs at 100% production capacity at all times, whereas a Warm Standby has zero running infrastructure." },
            @{ id = "C"; text = "A Pilot Light strategy offers a lower Recovery Time Objective (RTO) than an Active-Active strategy." },
            @{ id = "D"; text = "A Warm Standby strategy requires zero network connectivity between regions until a failover event occurs." }
        )
        correct_answer = @("A")
        explanation = "ความแตกต่างระหว่างกลยุทธ์ Disaster Recovery:
- Warm Standby จะเปิดระบบทุก Tier (Web, App, DB) ให้ทำงานอยู่ตลอดเวลาในขนาดที่ย่อส่วนลง (Scaled-down) สามารถรับโหลดงานบางส่วนได้ทันที ทำให้กู้คืนระบบได้รวดเร็วกว่า
- Pilot Light จะเปิดเฉพาะเซอร์วิสข้อมูลหลัก (เช่น Database Replication) ให้ทำงานและซิงค์ข้อมูลตลอดเวลา ส่วน Application Servers อื่น ๆ จะยังไม่เปิดหรือยังไม่สร้างขึ้น จนกว่าจะเกิดเหตุภัยพิบัติขึ้นจริง
- ตัวเลือก B, C, และ D อธิบายคุณลักษณะและลำดับเวลาการกู้คืนผิดพลาดอย่างสิ้นเชิง"
        tags = @("cloud-concepts", "disaster-recovery", "warm-standby", "pilot-light")
        references = @(
            @{
                title = "Oracle Cloud Infrastructure Concepts"
                url = "https://docs.oracle.com/en-us/iaas/Content/General/Concepts/cloudconcepts.htm"
            }
        )
    },
    @{
        id = "oci-fnd-001-q015"
        domain = "Cloud Concepts"
        subtopics = @("CapEx และ OpEx")
        difficulty = "hard"
        type = "multiple"
        scenario = $true
        question = "A finance manager is building a Total Cost of Ownership (TCO) comparison model to justify migrating from an on-premises data center to OCI. Which TWO indirect, operational, or facilities costs associated with on-premises deployments are completely eliminated by moving workloads to OCI? (Choose TWO)"
        options = @(
            @{ id = "A"; text = "Real estate leasing, electricity consumption, and HVAC cooling system maintenance for data center rooms" },
            @{ id = "B"; text = "Physical data center security personnel staffing, surveillance equipment, and biometric facility access maintenance" },
            @{ id = "C"; text = "Application development team salaries for writing proprietary business logic" },
            @{ id = "D"; text = "Purchasing office productivity laptops for corporate end users" },
            @{ id = "E"; text = "Corporate internet service provider bills for employee office workstations" }
        )
        correct_answer = @("A", "B")
        explanation = "ในการคำนวณ TCO ต้นทุนทางตรงและทางอ้อมของดาต้าเซ็นเตอร์ On-premises ที่หมดไปเมื่อย้ายไปใช้ OCI คือ:
- (A) ค่าเช่าสถานที่ดาต้าเซ็นเตอร์, ค่ากระแสไฟฟ้า และค่าบำรุงรักษาระบบปรับอากาศ (HVAC)
- (B) ค่าใช้จ่ายในการรักษาความปลอดภัยทางกายภาพ เช่น พนักงาน รปภ., กล้องวงจรปิด และระบบสแกนลายนิ้วมือ/ชีวมิติ
- ตัวเลือก C, D, และ E เป็นค่าใช้จ่ายทั่วไปขององค์กรที่ไม่ได้เกี่ยวข้องกับการมีหรือไม่มีดาต้าเซ็นเตอร์ของตนเอง"
        tags = @("cloud-concepts", "tco", "economics", "capex")
        references = @(
            @{
                title = "Oracle Cloud Infrastructure Concepts"
                url = "https://docs.oracle.com/en-us/iaas/Content/General/Concepts/cloudconcepts.htm"
            }
        )
    }
)
