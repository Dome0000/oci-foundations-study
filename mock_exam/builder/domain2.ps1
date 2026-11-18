# Domain 2: Getting Started with OCI (15 questions: Q016 - Q030)
# 12 single, 3 multiple (Q023, Q027, Q030)
# Difficulty: 5 easy, 6 medium, 4 hard
# Scenarios: 8 true, 7 false

$domain2 = @(
    @{
        id = "oci-fnd-001-q016"
        domain = "Getting Started with OCI"
        subtopics = @("OCI global architecture", "Regions, realms, availability domains และ fault domains")
        difficulty = "easy"
        type = "single"
        scenario = $false
        question = "What is an OCI Region, and what is its architectural relationship to Availability Domains (ADs)?"
        options = @(
            @{ id = "A"; text = "A Region is a localized geographic area containing one or more fault-isolated, physically distinct data centers called Availability Domains." },
            @{ id = "B"; text = "A Region is a virtual sub-compartment located inside an individual server chassis." },
            @{ id = "C"; text = "A Region is a single physical server rack containing three distinct network switches." },
            @{ id = "D"; text = "A Region is a global software registry that synchronizes user passwords across all cloud providers." }
        )
        correct_answer = @("A")
        explanation = "OCI Region คือพื้นที่ทางภูมิศาสตร์ที่เจาะจง (Localized geographic area) ซึ่งประกอบด้วยศูนย์ข้อมูลจริงที่แยกอิสระจากกัน (Fault-isolated data centers) ตั้งแต่ 1 ศูนย์ขึ้นไป เรียกว่า Availability Domains (ADs) โดยเชื่อมต่อกันด้วยเครือข่ายความเร็วสูง
- ตัวเลือก B, C และ D ไม่ถูกต้องตามนิยามทางสถาปัตยกรรมของ OCI Region"
        tags = @("getting-started", "regions", "availability-domains", "architecture")
        references = @(
            @{
                title = "Regions and Availability Domains"
                url = "https://docs.oracle.com/en-us/iaas/Content/General/Concepts/regions.htm"
            }
        )
    },
    @{
        id = "oci-fnd-001-q017"
        domain = "Getting Started with OCI"
        subtopics = @("Regions, realms, availability domains และ fault domains")
        difficulty = "easy"
        type = "single"
        scenario = $false
        question = "How many Fault Domains (FDs) are provisioned inside every OCI Availability Domain, and what is their primary design purpose?"
        options = @(
            @{ id = "A"; text = "Exactly three Fault Domains; to provide hardware-level anti-affinity against physical server, power, and rack switch failures within an Availability Domain." },
            @{ id = "B"; text = "Exactly two Fault Domains; to support active-passive database clustering." },
            @{ id = "C"; text = "A dynamic number between one and ten depending on the selected virtual cloud network size." },
            @{ id = "D"; text = "Exactly six Fault Domains; to match the maximum nesting depth of OCI compartments." }
        )
        correct_answer = @("A")
        explanation = "ในแต่ละ Availability Domain ของ OCI จะมี Fault Domain (FD) อยู่ 3 อันเสมอ (FD1, FD2, FD3) โดยแต่ละ FD จะมีฮาร์ดแวร์ พาวเวอร์ซัพพลาย และ Top-of-rack network switch แยกจากกัน เพื่อป้องกันความเสียหายจากความล้มเหลวของฮาร์ดแวร์ หรือการซ่อมบำรุงตามรอบภายใน AD เดียวกัน (Anti-affinity)
- ตัวเลือก B ผิด เพราะมี 3 FDs ไม่ใช่ 2
- ตัวเลือก C ผิด เพราะจำนวน FD คงที่เสมอ ไม่ขึ้นกับขนาด VCN
- ตัวเลือก D ผิด เพราะจำนวน 6 คือระดับความลึกสูงสุดของ Compartment ไม่เกี่ยวกับ FD"
        tags = @("getting-started", "fault-domains", "high-availability")
        references = @(
            @{
                title = "Regions and Availability Domains"
                url = "https://docs.oracle.com/en-us/iaas/Content/General/Concepts/regions.htm"
            }
        )
    },
    @{
        id = "oci-fnd-001-q018"
        domain = "Getting Started with OCI"
        subtopics = @("การเลือก Region และการออกแบบเพื่อ Availability")
        difficulty = "medium"
        type = "single"
        scenario = $true
        question = "A cloud solutions architect is designing a mission-critical web application in an OCI Region that contains only one Availability Domain. Which design pattern should the architect implement to ensure high availability against localized hardware crashes?"
        options = @(
            @{ id = "A"; text = "Distribute redundant compute instances across all three Fault Domains behind an OCI Load Balancer." },
            @{ id = "B"; text = "Deploy all compute instances within the same single Fault Domain to eliminate internal latency." },
            @{ id = "C"; text = "Attach multiple Internet Gateways to the same Virtual Cloud Network." },
            @{ id = "D"; text = "Create separate root tenancies for each application tier." }
        )
        correct_answer = @("A")
        explanation = "ใน Region ที่มี Availability Domain เดียว (Single-AD Region) วิธีการออกแบบระบบ High Availability ที่ดีที่สุดคือการกระจาย Compute Instances ให้ทำงานอยู่ข้ามทั้ง 3 Fault Domains (FD1, FD2, FD3) และวางไว้หลัง Load Balancer เพื่อให้มั่นใจว่าหากตู้แร็กหรือสวิตช์ใน FD ใดเสียหาย เครื่องใน FD อื่นยังสามารถให้บริการทดแทนได้ทันที
- ตัวเลือก B จะเพิ่มความเสี่ยงเพราะหาก FD นั้นพัง ระบบทั้งหมดจะล่ม
- ตัวเลือก C ผิด เพราะ 1 VCN มี Internet Gateway ได้เพียงตัวเดียว
- ตัวเลือก D การสร้าง Tenancy ใหม่ไม่ได้แก้ปัญหาความพร้อมใช้งานของเวิร์กโหลด"
        tags = @("getting-started", "high-availability", "fault-domains", "scenarios")
        references = @(
            @{
                title = "Best Practices for High Availability"
                url = "https://docs.oracle.com/en-us/iaas/Content/General/Concepts/regions.htm"
            }
        )
    },
    @{
        id = "oci-fnd-001-q019"
        domain = "Getting Started with OCI"
        subtopics = @("Tenancy และ compartments")
        difficulty = "medium"
        type = "single"
        scenario = $true
        question = "An enterprise is structuring its cloud governance framework across multiple subsidiaries and departments. What is a fundamental rule regarding OCI Compartment hierarchy and cross-compartment resource interaction?"
        options = @(
            @{ id = "A"; text = "Compartments can be nested up to six levels deep, and resources in different compartments can interact over the network if network routing and IAM policies permit." },
            @{ id = "B"; text = "Compartments cannot be nested, and all resources must reside directly in the Root compartment." },
            @{ id = "C"; text = "Resources residing in different compartments are completely isolated at the network level and can never communicate." },
            @{ id = "D"; text = "Deleting a parent compartment automatically moves all sub-compartments and child resources to the Root compartment." }
        )
        correct_answer = @("A")
        explanation = "Compartment ใน OCI สามารถสร้างซ้อนกันได้ลึกสูงสุด 6 ระดับ (Nesting up to 6 levels) และ Compartment เป็นเพียงการจัดกลุ่มเชิงตรรกะเพื่อการบริหารจัดการและกำหนดสิทธิ์ ไม่ใช่กำแพงกั้นเน็ตเวิร์ก ทรัพยากรที่อยู่คนละ Compartment จึงสามารถติดต่อสื่อสารกันผ่านระบบเครือข่ายได้ตามปกติหากมีเส้นทางและนโยบายอนุญาต
- ตัวเลือก B ผิด เพราะ Compartment ซ้อนกันได้ถึง 6 ระดับ
- ตัวเลือก C ผิด เพราะ Compartment ไม่ได้บล็อกการติดต่อทางเน็ตเวิร์ก
- ตัวเลือก D ผิด การลบ Compartment แม่จะลบ Compartment ลูกและทรัพยากรภายในทั้งหมดหากได้รับอนุญาต"
        tags = @("getting-started", "compartments", "governance")
        references = @(
            @{
                title = "Managing Compartments"
                url = "https://docs.oracle.com/en-us/iaas/Content/Identity/Tasks/managingcompartments.htm"
            }
        )
    },
    @{
        id = "oci-fnd-001-q020"
        domain = "Getting Started with OCI"
        subtopics = @("Tenancy และ compartments")
        difficulty = "easy"
        type = "single"
        scenario = $false
        question = "What top-level logical container is automatically created when an organization signs up for an Oracle Cloud Infrastructure account?"
        options = @(
            @{ id = "A"; text = "The Tenancy, which automatically serves as the Root Compartment" },
            @{ id = "B"; text = "A Regional Virtual Cloud Network with pre-configured subnets" },
            @{ id = "C"; text = "An Autonomous Transaction Processing database instance" },
            @{ id = "D"; text = "A Customer Support Identifier (CSI) group vault" }
        )
        correct_answer = @("A")
        explanation = "เมื่อสมัครเปิดบัญชีใช้งาน OCI ระบบจะสร้าง Tenancy ขึ้นมาให้โดยอัตโนมัติ ซึ่ง Tenancy นี้จะทำหน้าที่เป็น Root Compartment (คอนเทนเนอร์ระดับสูงสุด) ของบัญชี โดยทรัพยากร, ผู้ใช้งาน, กลุ่ม, นโยบายสิทธิ์ (Policies) และ Compartment ย่อยทั้งหมดจะอยู่ภายใต้ Tenancy นี้เสมอ
- ตัวเลือก B, C และ D เป็นเซอร์วิสที่ผู้ใช้ต้องเป็นผู้สร้างเองในภายหลัง ไม่ได้สร้างขึ้นมาเป็น Root Logical Container อัตโนมัติ"
        tags = @("getting-started", "tenancy", "root-compartment")
        references = @(
            @{
                title = "Overview of the Tenancy"
                url = "https://docs.oracle.com/en-us/iaas/Content/Identity/Concepts/overview.htm"
            }
        )
    },
    @{
        id = "oci-fnd-001-q021"
        domain = "Getting Started with OCI"
        subtopics = @("Tenancy และ compartments", "Resource organization, tagging, quotas และ service limits")
        difficulty = "medium"
        type = "single"
        scenario = $true
        question = "An administrator moves an existing OCI Block Volume from compartment 'Project_Alpha' to compartment 'Project_Beta'. What happens to the block volume's Oracle Cloud Identifier (OCID) and its active IAM access permissions immediately after the move?"
        options = @(
            @{ id = "A"; text = "The OCID remains completely unchanged, but access permissions immediately switch to reflect the IAM policies applied to compartment 'Project_Beta'." },
            @{ id = "B"; text = "A new OCID is automatically generated, and permissions from both compartments remain active simultaneously." },
            @{ id = "C"; text = "The OCID changes, while permissions remain permanently tied to 'Project_Alpha'." },
            @{ id = "D"; text = "The block volume is detached from its instance and its data is erased until a support ticket is opened." }
        )
        correct_answer = @("A")
        explanation = "เมื่อย้ายทรัพยากรข้าม Compartment:
1. ค่า OCID ของทรัพยากรจะคงเดิมเสมอ ไม่มีการเปลี่ยนแปลง
2. สิทธิ์ในการเข้าถึงทรัพยากรจะเปลี่ยนไปตาม IAM Policies ที่ผูกอยู่กับ Compartment ปลายทาง ('Project_Beta') ทันที
- ตัวเลือก B และ C ผิด เพราะ OCID ไม่เคยเปลี่ยนตลอดอายุทรัพยากร
- ตัวเลือก D ผิด เพราะการย้าย Compartment ไม่กระทบกับข้อมูลหรือการ Attach ของ Volume"
        tags = @("getting-started", "compartments", "ocid", "iam")
        references = @(
            @{
                title = "Moving Resources to a Different Compartment"
                url = "https://docs.oracle.com/en-us/iaas/Content/Identity/Tasks/managingcompartments.htm"
            }
        )
    },
    @{
        id = "oci-fnd-001-q022"
        domain = "Getting Started with OCI"
        subtopics = @("Oracle Cloud Identifier หรือ OCID")
        difficulty = "easy"
        type = "single"
        scenario = $false
        question = "What is an Oracle Cloud Identifier (OCID), and what is its standard syntactic pattern?"
        options = @(
            @{ id = "A"; text = "An Oracle-assigned globally unique identifier for every OCI resource, following the pattern ocid1.<resource_type>.<realm>.[region].<future_reserved>.<unique_id>." },
            @{ id = "B"; text = "A user-defined custom text label assigned to compute instances for billing chargebacks." },
            @{ id = "C"; text = "A private cryptographic SSL certificate string used for database connection encryption." },
            @{ id = "D"; text = "An IPv6 gateway address automatically bound to an Internet Gateway." }
        )
        correct_answer = @("A")
        explanation = "Oracle Cloud Identifier (OCID) คือรหัสระบุเฉพาะตัวระดับสากลที่ระบบ OCI สร้างให้กับทุกทรัพยากรโดยอัตโนมัติ มีรูปแบบโครงสร้างมาตรฐานคือ ocid1.<resource_type>.<realm>.[region].<future_reserved>.<unique_id> ซึ่งไม่ซ้ำกันและไม่สามารถแก้ไขได้
- ตัวเลือก B คือคำอธิบายของ Tags (Defined/Free-form)
- ตัวเลือก C คือกุญแจเข้ารหัส SSL/TLS
- ตัวเลือก D คือที่อยู่ไอพี (IP Address)"
        tags = @("getting-started", "ocid", "resource-organization")
        references = @(
            @{
                title = "Resource Identifiers (OCIDs)"
                url = "https://docs.oracle.com/en-us/iaas/Content/General/Concepts/identifiers.htm"
            }
        )
    },
    @{
        id = "oci-fnd-001-q023"
        domain = "Getting Started with OCI"
        subtopics = @("OCI Console, API, CLI และ SDK ในระดับพื้นฐาน")
        difficulty = "medium"
        type = "multiple"
        scenario = $false
        question = "A developer wants to automate the provisioning and scaling of OCI infrastructure using command-line scripts and custom software applications. Which TWO interfaces are officially provided by OCI for this purpose? (Choose TWO)"
        options = @(
            @{ id = "A"; text = "OCI Command Line Interface (CLI)" },
            @{ id = "B"; text = "OCI Software Development Kits (SDKs) in languages such as Python, Java, and TypeScript" },
            @{ id = "C"; text = "OCI Telnet Management Service" },
            @{ id = "D"; text = "OCI Desktop Native Binary Daemon" },
            @{ id = "E"; text = "OCI SNMP MIB Editor" }
        )
        correct_answer = @("A", "B")
        explanation = "ช่องทางหลักที่ OCI ให้บริการในการเขียนโปรแกรมและจัดการผ่านสคริปต์อัตโนมัติ ได้แก่:
- (A) OCI Command Line Interface (CLI): เครื่องมือสั่งการและจัดการทรัพยากรผ่านเทอร์มินัล
- (B) OCI SDKs: ไลบรารีสำหรับนักพัฒนาในภาษาต่าง ๆ เช่น Python, Java, TypeScript, Go, .NET
นอกจากนี้ยังมี OCI REST APIs และ OCI Resource Manager (Terraform)
- ตัวเลือก C, D, และ E ไม่ใช่เครื่องมือของ OCI"
        tags = @("getting-started", "cli", "sdk", "automation")
        references = @(
            @{
                title = "SDK and CLI Overview"
                url = "https://docs.oracle.com/en-us/iaas/Content/API/Concepts/sdkoverview.htm"
            }
        )
    },
    @{
        id = "oci-fnd-001-q024"
        domain = "Getting Started with OCI"
        subtopics = @("Resource organization, tagging, quotas และ service limits")
        difficulty = "hard"
        type = "single"
        scenario = $true
        question = "A cloud platform engineer must ensure that developers working in the 'QA_Testing' compartment cannot consume more than 20 OCPUs of high-performance compute shapes, preventing unexpected budget overruns. Which OCI governance mechanism is specifically designed to enforce resource limits on compartments via policy statements?"
        options = @(
            @{ id = "A"; text = "Compartment Quotas" },
            @{ id = "B"; text = "Free-form Tags" },
            @{ id = "C"; text = "Service Limits" },
            @{ id = "D"; text = "Security Lists" }
        )
        correct_answer = @("A")
        explanation = "Compartment Quotas เป็นกลไกที่ช่วยให้ผู้ดูแลระบบสามารถกำหนดเพดานการใช้ทรัพยากรในแต่ละ Compartment ได้อย่างเจาะจงผ่านประโยค Policy เช่น `set compute quota... in compartment QA_Testing` เพื่อป้องกันไม่ให้ทีมใช้งานทรัพยากรเกินงบประมาณที่กำหนด
- ตัวเลือก B (Free-form Tags) เป็นเพียงการติดป้ายข้อความ ไม่สามารถบังคับจำกัดจำนวนได้
- ตัวเลือก C (Service Limits) คือขีดจำกัดระดับ Tenancy ที่ตั้งโดย Oracle ไม่สามารถใช้เขียน Policy ควบคุม Compartment เฉพาะแบบนี้ได้
- ตัวเลือก D (Security Lists) ใช้สำหรับจัดการไฟร์วอลล์ของ Subnet"
        tags = @("getting-started", "compartment-quotas", "governance")
        references = @(
            @{
                title = "Compartment Quotas"
                url = "https://docs.oracle.com/en-us/iaas/Content/General/Concepts/resourcequotas.htm"
            }
        )
    },
    @{
        id = "oci-fnd-001-q025"
        domain = "Getting Started with OCI"
        subtopics = @("Resource organization, tagging, quotas และ service limits")
        difficulty = "medium"
        type = "single"
        scenario = $true
        question = "A financial controller mandates that all provisioned resources across the tenancy must have a valid 'Department' tag selected from a standardized list of pre-approved department names, preventing typos and untracked expenditures. Which tagging mechanism should be implemented?"
        options = @(
            @{ id = "A"; text = "Defined Tags with a Tag Namespace and a predefined list of allowed values" },
            @{ id = "B"; text = "Free-form Tags with open text fields typed by developers" },
            @{ id = "C"; text = "Root compartment DNS metadata annotations" },
            @{ id = "D"; text = "Operating system host environment variables" }
        )
        correct_answer = @("A")
        explanation = "Defined Tags มีการจัดโครงสร้างอย่างเป็นระบบภายใต้ Tag Namespace โดยผู้ดูแลระบบสามารถกำหนด Predefined list of allowed values (รายการค่าที่อนุญาตให้เลือก) ได้ ซึ่งช่วยป้องกันการพิมพ์ผิด (Typo) และบังคับให้ผู้ใช้งานต้องเลือกค่าตามมาตรฐานที่ฝ่ายการเงินกำหนดเท่านั้น
- ตัวเลือก B (Free-form Tags) เป็นการพิมพ์ข้อความแบบอิสระ ไม่มีการตรวจสอบความถูกต้องหรือบังคับ Schema
- ตัวเลือก C และ D ไม่ใช่คุณลักษณะการจัดการแท็กของ OCI"
        tags = @("getting-started", "defined-tags", "cost-tracking")
        references = @(
            @{
                title = "Overview of Tagging"
                url = "https://docs.oracle.com/en-us/iaas/Content/Tagging/Concepts/taggingoverview.htm"
            }
        )
    },
    @{
        id = "oci-fnd-001-q026"
        domain = "Getting Started with OCI"
        subtopics = @("Resource organization, tagging, quotas และ service limits")
        difficulty = "hard"
        type = "single"
        scenario = $true
        question = "A cloud administrator attempting to launch a new database VM instance receives an error indicating that the tenancy has reached the maximum permitted instance count for that shape family in the region. How can the administrator increase this limit?"
        options = @(
            @{ id = "A"; text = "Submit a Service Limit Increase request through the OCI Console or My Oracle Support." },
            @{ id = "B"; text = "Reconfigure the VCN route table with an additional default route to the Internet Gateway." },
            @{ id = "C"; text = "Delete and recreate the Root compartment with an updated service quota." },
            @{ id = "D"; text = "Attach a secondary private IP address to an existing compute instance." }
        )
        correct_answer = @("A")
        explanation = "Service Limits (ขีดจำกัดบริการ) คือเพดานการจัดสรรทรัพยากรระดับ Tenancy ในแต่ละ Region ที่ Oracle กำหนดไว้เริ่มต้น หากต้องการขยายจำนวนเครื่องหรือสเปกเพิ่มเติม ผู้ดูแลระบบจะต้องส่งคำขอ 'Service Limit Increase' ผ่าน OCI Console หรือเปิด Ticket บน My Oracle Support (MOS)
- ตัวเลือก B และ D เป็นการตั้งค่าระบบเน็ตเวิร์ก ไม่เกี่ยวกับขีดจำกัดทรัพยากรของ Tenancy
- ตัวเลือก C ผิด เพราะ Root compartment เป็นโครงสร้างหลักที่ไม่สามารถลบได้"
        tags = @("getting-started", "service-limits", "support")
        references = @(
            @{
                title = "Service Limits"
                url = "https://docs.oracle.com/en-us/iaas/Content/General/Concepts/servicelimits.htm"
            }
        )
    },
    @{
        id = "oci-fnd-001-q027"
        domain = "Getting Started with OCI"
        subtopics = @("Regions, realms, availability domains และ fault domains")
        difficulty = "medium"
        type = "multiple"
        scenario = $false
        question = "What is an OCI Realm, and which TWO statements correctly characterize realms within OCI architecture? (Choose TWO)"
        options = @(
            @{ id = "A"; text = "A Realm is a distinct logical collection of regions that share isolated identities, data, and encryption keys from all other realms." },
            @{ id = "B"; text = "Commercial regions belong to the primary commercial realm (OC1), while government cloud regions reside in separate, isolated government realms." },
            @{ id = "C"; text = "All OCI realms share the same unified IAM user pool, enabling seamless single sign-on across government and commercial regions." },
            @{ id = "D"; text = "A Realm is a client-side virtual machine emulator used to test OCI CLI scripts locally." },
            @{ id = "E"; text = "Realms are automatically created whenever a new VCN subnet is provisioned." }
        )
        correct_answer = @("A", "B")
        explanation = "คุณลักษณะของ OCI Realm:
- (A) Realm คือกลุ่มของ Region ที่มีการแยกขาดจากกันโดยสิ้นเชิง ทั้งระบบ Identity, บัญชีผู้ใช้, ข้อมูล และกุญแจเข้ารหัส
- (B) OCI แบ่ง Realm ตามลักษณะความปลอดภัย เช่น Commercial Realm (OC1) สำหรับธุรกิจทั่วไป และ Government Realms (เช่น OC2, OC3) สำหรับหน่วยงานความมั่นคงภาครัฐ
- ตัวเลือก C ผิด เพราะแต่ละ Realm แยก Identity กันอย่างสมบูรณ์ ไม่สามารถใช้บัญชีร่วมกันได้
- ตัวเลือก D และ E ไม่ใช่นิยามของ OCI Realm"
        tags = @("getting-started", "realms", "architecture")
        references = @(
            @{
                title = "Regions and Availability Domains"
                url = "https://docs.oracle.com/en-us/iaas/Content/General/Concepts/regions.htm"
            }
        )
    },
    @{
        id = "oci-fnd-001-q028"
        domain = "Getting Started with OCI"
        subtopics = @("OCI Console, API, CLI และ SDK ในระดับพื้นฐาน")
        difficulty = "easy"
        type = "single"
        scenario = $false
        question = "What is OCI Cloud Shell, and what primary operational benefit does it provide?"
        options = @(
            @{ id = "A"; text = "A free, browser-based Linux terminal integrated into the OCI Console that comes pre-authenticated and pre-installed with the OCI CLI, Git, and developer tools." },
            @{ id = "B"; text = "A physical hardware appliance shipped to customer data centers for bulk data migration." },
            @{ id = "C"; text = "A desktop GUI software application required to configure OCI Site-to-Site VPN tunnels." },
            @{ id = "D"; text = "A proprietary programming language created by Oracle to write serverless functions." }
        )
        correct_answer = @("A")
        explanation = "OCI Cloud Shell คือเทอร์มินัล Linux บนเว็บเบราว์เซอร์ที่เปิดใช้งานได้ฟรีจาก OCI Console โดยตรง มาพร้อมพื้นที่จัดเก็บข้อมูลส่วนตัว และมีการติดตั้ง OCI CLI, Git, Terraform, Docker พร้อมทั้งทำ Authentication กับบัญชีที่ล็อกอินอยู่โดยอัตโนมัติ ทำให้เริ่มใช้งานและรันคำสั่งได้ทันทีโดยไม่ต้องลงโปรแกรมในเครื่องตนเอง
- ตัวเลือก B คือคำอธิบายของ OCI Data Transfer Appliance
- ตัวเลือก C และ D ไม่ใช่ Cloud Shell"
        tags = @("getting-started", "cloud-shell", "tools")
        references = @(
            @{
                title = "Cloud Shell Overview"
                url = "https://docs.oracle.com/en-us/iaas/Content/API/Concepts/cloudshellintro.htm"
            }
        )
    },
    @{
        id = "oci-fnd-001-q029"
        domain = "Getting Started with OCI"
        subtopics = @("การเลือก Region และการออกแบบเพื่อ Availability")
        difficulty = "hard"
        type = "single"
        scenario = $true
        question = "A multinational retail bank is preparing to deploy an online banking application in OCI. Which three primary factors must the architecture team evaluate when choosing the appropriate OCI Region?"
        options = @(
            @{ id = "A"; text = "Data residency laws and compliance regulations, geographic proximity to end users to minimize latency, and availability of required OCI services in that region" },
            @{ id = "B"; text = "Data center building architecture, proximity to hardware manufacturing plants, and local real estate taxes" },
            @{ id = "C"; text = "Ensuring the region has a minimum of ten Availability Domains, avoidance of all commercial realms, and free egress bandwidth" },
            @{ id = "D"; text = "Alphabetical naming convention of the region, time zone alignment with Oracle headquarters, and public IP pool sizes" }
        )
        correct_answer = @("A")
        explanation = "ปัจจัยสำคัญ 3 ประการในการเลือก OCI Region:
1. Data Residency / Compliance: กฎหมายการเก็บรักษาข้อมูลของประเทศนั้น ๆ (เช่น ข้อมูลการเงินต้องอยู่ในประเทศ)
2. Latency / Proximity: ความใกล้ชิดทางภูมิศาสตร์กับผู้ใช้งานเพื่อลดความล่าช้าในการตอบสนองของระบบ
3. Service Availability: ความพร้อมให้บริการของเซอร์วิสที่แอปพลิเคชันต้องการใน Region นั้น
- ตัวเลือก B, C และ D ไม่ใช่หลักเกณฑ์ทางเทคนิคในการเลือก Region"
        tags = @("getting-started", "region-selection", "architecture", "scenarios")
        references = @(
            @{
                title = "Regions and Availability Domains"
                url = "https://docs.oracle.com/en-us/iaas/Content/General/Concepts/regions.htm"
            }
        )
    },
    @{
        id = "oci-fnd-001-q030"
        domain = "Getting Started with OCI"
        subtopics = @("Regions, realms, availability domains และ fault domains")
        difficulty = "hard"
        type = "multiple"
        scenario = $true
        question = "An enterprise is planning a high-availability database cluster across an OCI multi-AD region. Which TWO statements accurately describe the physical and operational characteristics of OCI Availability Domains? (Choose TWO)"
        options = @(
            @{ id = "A"; text = "Availability Domains within the same region are interconnected by a dedicated, high-bandwidth, low-latency private network." },
            @{ id = "B"; text = "Each Availability Domain is fully fault-isolated, meaning an unexpected power or cooling failure in one AD will not propagate to another AD." },
            @{ id = "C"; text = "All Availability Domains within a region share the same physical server racks and backup generators." },
            @{ id = "D"; text = "Data stored in an Availability Domain is automatically and synchronously mirrored to all other regions worldwide at zero cost." },
            @{ id = "E"; text = "Customers can physically relocate an Availability Domain between different continents via the OCI Console." }
        )
        correct_answer = @("A", "B")
        explanation = "คุณลักษณะของ Availability Domains (ADs):
- (A) ADs ใน Region เดียวกันจะเชื่อมต่อกันด้วยโครงข่ายไฟเบอร์ส่วนตัวที่มีแบนด์วิดท์สูงและ Latency ต่ำมาก ช่วยให้ทำ Data Replication ได้อย่างมีประสิทธิภาพ
- (B) AD แต่ละแห่งเป็นศูนย์ข้อมูลทางกายภาพที่แยกอิสระจากกัน (Fault-isolated) ทั้งระบบจ่ายไฟและระบบทำความเย็น ความเสียหายใน AD หนึ่งจึงไม่ลามไปกระทบ AD อื่น
- ตัวเลือก C ผิด เพราะ ADs แยกตึกและแยกระบบสาธารณูปโภคกันอย่างสิ้นเชิง
- ตัวเลือก D ผิด เพราะไม่มีการ Synchronous replicate ข้ามโลกให้อัตโนมัติ
- ตัวเลือก E ผิด เพราะ AD เป็นศูนย์ข้อมูลจริง ไม่สามารถย้ายข้ามทวีปได้"
        tags = @("getting-started", "availability-domains", "high-availability")
        references = @(
            @{
                title = "Regions and Availability Domains"
                url = "https://docs.oracle.com/en-us/iaas/Content/General/Concepts/regions.htm"
            }
        )
    }
)
