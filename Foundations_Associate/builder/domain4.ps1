# Domain 4: Security and Compliance (15 questions: Q076 - Q090)
# 12 single, 3 multiple (Q081, Q089, Q090)
# Difficulty: 5 easy, 6 medium, 4 hard
# Scenarios: 8 true, 7 false

$domain4 = @(
    @{
        id = "oci-fnd-001-q076"
        domain = "Security and Compliance"
        subtopics = @("Principals, authentication และ authorization", "IAM users, groups, dynamic groups และ compartments")
        difficulty = "easy"
        type = "single"
        scenario = $false
        question = "What is an OCI Instance Principal, and why is it considered a security best practice?"
        options = @(
            @{ id = "A"; text = "An IAM feature that allows compute instances to be authorized to call OCI APIs directly without embedding long-term API signing keys or credentials in application code." },
            @{ id = "B"; text = "A dedicated administrator user account used strictly to access the physical server room." },
            @{ id = "C"; text = "A hardware security key plugged directly into a workstation USB port." },
            @{ id = "D"; text = "An encrypted password stored in an open-text configuration file on the boot volume." }
        )
        correct_answer = @("A")
        explanation = "Instance Principal เป็นฟีเจอร์ของ OCI IAM ที่อนุญาตให้ Compute Instance (หรือทรัพยากรอื่น) ได้รับการยืนยันตัวตนและสิทธิ์ในการเรียกใช้ OCI APIs ได้โดยตรงผ่านใบรับรองที่ OCI จัดการให้ (Managed certificates) โดยนักพัฒนาไม่จำเป็นต้องฝัง API Private Key หรือรหัสผ่านไว้ในซอร์สโค้ดของแอปพลิเคชัน จึงช่วยลดความเสี่ยงที่ข้อมูลยืนยันตัวตนจะรั่วไหล
- ตัวเลือก B, C และ D ไม่ใช่นิยามของ Instance Principal"
        tags = @("security", "iam", "instance-principals", "best-practices")
        references = @(
            @{
                title = "Calling Services from an Instance"
                url = "https://docs.oracle.com/en-us/iaas/Content/Identity/Tasks/callingservicesfrominstances.htm"
            }
        )
    },
    @{
        id = "oci-fnd-001-q077"
        domain = "Security and Compliance"
        subtopics = @("IAM users, groups, dynamic groups และ compartments")
        difficulty = "medium"
        type = "single"
        scenario = $true
        question = "A security administrator needs to grant a fleet of compute virtual machines running in the 'Analytics_Prod' compartment permission to read datasets from an Object Storage bucket. Which IAM entity allows compute instances to be grouped together based on matching criteria (such as their compartment OCID) so that IAM policies can be applied to them?"
        options = @(
            @{ id = "A"; text = "Dynamic Groups" },
            @{ id = "B"; text = "Standard User Groups" },
            @{ id = "C"; text = "Network Security Groups" },
            @{ id = "D"; text = "Service Limits Groups" }
        )
        correct_answer = @("A")
        explanation = "Dynamic Groups เป็นกลุ่มประเภทพิเศษใน OCI IAM ที่ใช้สำหรับจัดกลุ่มทรัพยากร (เช่น Compute Instances) โดยใช้กฎเกณฑ์จับคู่ (Matching Rules) เช่น `instance.compartment.id = 'ocid1.compartment.oc1...'` เมื่ออินสแตนซ์ตรงตามเงื่อนไข จะได้รับสิทธิ์ตาม IAM Policy ที่กำหนดให้กับ Dynamic Group นั้นทันที
- ตัวเลือก B (Standard User Groups) ใช้สำหรับจัดกลุ่มผู้ใช้งานที่เป็นมนุษย์ (IAM Users) เท่านั้น
- ตัวเลือก C (Network Security Groups) เป็นไฟร์วอลล์เน็ตเวิร์ก ไม่ใช่การกำหนดสิทธิ์ IAM
- ตัวเลือก D ไม่มีอยู่จริงใน OCI"
        tags = @("security", "iam", "dynamic-groups", "scenarios")
        references = @(
            @{
                title = "Managing Dynamic Groups"
                url = "https://docs.oracle.com/en-us/iaas/Content/Identity/Tasks/managingdynamicgroups.htm"
            }
        )
    },
    @{
        id = "oci-fnd-001-q078"
        domain = "Security and Compliance"
        subtopics = @("IAM policy syntax และ policy evaluation ในระดับพื้นฐาน")
        difficulty = "easy"
        type = "single"
        scenario = $false
        question = "What is the basic syntactic structure of an OCI IAM Policy statement?"
        options = @(
            @{ id = "A"; text = "Allow <subject> to <verb> <resource-type> in <location> where <conditions>" },
            @{ id = "B"; text = "Grant <resource-type> from <user> to <role> when <ip_address>" },
            @{ id = "C"; text = "Deny <subject> on <server> except <compartment> within <region>" },
            @{ id = "D"; text = "Permit <group> with <password> to <endpoint> after <timestamp>" }
        )
        correct_answer = @("A")
        explanation = "ไวยากรณ์พื้นฐานมาตรฐานของนโยบายสิทธิ์ (IAM Policy Statement) ใน OCI คือ:
`Allow <subject> to <verb> <resource-type> in <location> where <conditions>`
ตัวอย่างเช่น: `Allow group NetworkAdmins to manage virtual-network-family in compartment Production`
- ตัวเลือก B, C, และ D ไม่ใช่ไวยากรณ์ของ OCI IAM Policy (OCI Policy ไม่มีคำสั่ง Deny ในประโยคนโยบายพื้นฐาน)"
        tags = @("security", "iam", "policy-syntax")
        references = @(
            @{
                title = "Policy Syntax"
                url = "https://docs.oracle.com/en-us/iaas/Content/Identity/Concepts/policysyntax.htm"
            }
        )
    },
    @{
        id = "oci-fnd-001-q079"
        domain = "Security and Compliance"
        subtopics = @("IAM policy syntax และ policy evaluation ในระดับพื้นฐาน")
        difficulty = "medium"
        type = "single"
        scenario = $true
        question = "A security lead wants to grant an external compliance auditor the ability to view resource metadata, such as listing compute instances and inspecting their configurations, but strictly prevent the auditor from accessing instance data or creating, modifying, or terminating any resources. Which OCI IAM verb provides this minimal level of read-only metadata inspection?"
        options = @(
            @{ id = "A"; text = "inspect" },
            @{ id = "B"; text = "read" },
            @{ id = "C"; text = "use" },
            @{ id = "D"; text = "manage" }
        )
        correct_answer = @("A")
        explanation = "ลำดับชั้นของคำกริยา (Verbs) ใน OCI IAM Policy เรียงจากสิทธิ์น้อยที่สุดไปมากที่สุดคือ:
1. `inspect`: ดูเฉพาะ Metadata ของทรัพยากร (เช่น ลิสต์รายชื่อ ดูสถานะ) โดยไม่สามารถอ่านเนื้อหาข้อมูลจริงได้
2. `read`: รวมถึง inspect บวกกับความสามารถในการดูข้อมูลจริงของทรัพยากร (เช่น ดาวน์โหลดไฟล์)
3. `use`: รวมถึง read บวกกับการใช้งานทรัพยากร (เช่น สตาร์ต/สต็อปเครื่อง) แต่ไม่สามารถสร้างหรือลบได้
4. `manage`: สิทธิ์สูงสุด สามารถสร้าง ปรับแต่ง และลบทรัพยากรได้ทั้งหมด
ดังนั้นสำหรับผู้ตรวจสอบที่ต้องการดูแค่ Metadata คำตอบคือ `inspect`
- ตัวเลือก B, C, และ D ให้สิทธิ์เกินความจำเป็น"
        tags = @("security", "iam", "verbs", "least-privilege")
        references = @(
            @{
                title = "Policy Verbs"
                url = "https://docs.oracle.com/en-us/iaas/Content/Identity/Concepts/policyverboverview.htm"
            }
        )
    },
    @{
        id = "oci-fnd-001-q080"
        domain = "Security and Compliance"
        subtopics = @("IAM policy syntax และ policy evaluation ในระดับพื้นฐาน")
        difficulty = "hard"
        type = "single"
        scenario = $true
        question = "An administrator creates a new IAM user account and adds the user to a newly created group called 'Contractors'. No IAM policies have been written that reference the 'Contractors' group or the user. Which actions can this user perform across the OCI tenancy?"
        options = @(
            @{ id = "A"; text = "Zero actions; OCI IAM operates on a strict default-deny model where users have no permissions until explicitly granted via an ALLOW policy." },
            @{ id = "B"; text = "Read-only access to all resources in the Root compartment." },
            @{ id = "C"; text = "Full administrative access within the Sandbox compartment." },
            @{ id = "D"; text = "Ability to launch small compute shapes and create autonomous databases." }
        )
        correct_answer = @("A")
        explanation = "OCI IAM ยึดหลักการความปลอดภัยแบบ 'Default Deny' (ปฏิเสธไว้ก่อนโดยค่าเริ่มต้น) หมายความว่าผู้ใช้และกลุ่มที่สร้างขึ้นใหม่จะไม่มีสิทธิ์เข้าถึงหรือสั่งการใด ๆ ในระบบคลาวด์เลย จนกว่าผู้ดูแลระบบจะเขียนประโยค Policy ที่ระบุ 'Allow...' ให้อย่างชัดเจนเท่านั้น
- ตัวเลือก B, C และ D ไม่ถูกต้อง เพราะผู้ใช้ใหม่จะไม่มีสิทธิ์ใด ๆ ทั้งสิ้นแม้แต่การอ่าน (Read)"
        tags = @("security", "iam", "policy-evaluation", "default-deny")
        references = @(
            @{
                title = "How Policies Work"
                url = "https://docs.oracle.com/en-us/iaas/Content/Identity/Concepts/policies.htm"
            }
        )
    },
    @{
        id = "oci-fnd-001-q081"
        domain = "Security and Compliance"
        subtopics = @("MFA และ least privilege", "Principals, authentication และ authorization")
        difficulty = "easy"
        type = "multiple"
        scenario = $false
        question = "Which TWO authentication credentials are natively supported by OCI Identity and Access Management (IAM) for authenticating users and programmatic API clients? (Choose TWO)"
        options = @(
            @{ id = "A"; text = "Console Password combined with Multi-Factor Authentication (MFA)" },
            @{ id = "B"; text = "API Signing Key (RSA public/private key pair in PEM format)" },
            @{ id = "C"; text = "Handwritten physical signature scanned via webcam" },
            @{ id = "D"; text = "Unencrypted plaintext passwords sent via SMS to all network switches" },
            @{ id = "E"; text = "Shared root passwords posted in public GitHub repositories" }
        )
        correct_answer = @("A", "B")
        explanation = "ช่องทางการยืนยันตัวตน (Authentication Credentials) ที่ OCI IAM รองรับ ได้แก่:
- (A) Console Password: สำหรับการล็อกอินเข้า OCI Web Console โดยแนะนำให้เปิดใช้งาน Multi-Factor Authentication (MFA) ร่วมด้วย
- (B) API Signing Key: กุญแจเข้ารหัสคู่ RSA (Public/Private Key) สำหรับการยืนยันตัวตนเมื่อเรียกใช้งาน OCI CLI, SDKs หรือ REST APIs
นอกจากนี้ยังมี Auth Tokens, Customer Secret Keys (สำหรับ S3-compatible APIs) และ OAuth 2.0 Tokens
- ตัวเลือก C, D, และ E ไม่ใช่วิธีการยืนยันตัวตนที่ปลอดภัยและไม่มีใน OCI"
        tags = @("security", "iam", "authentication", "mfa", "api-keys")
        references = @(
            @{
                title = "Managing User Credentials"
                url = "https://docs.oracle.com/en-us/iaas/Content/Identity/Tasks/managingcredentials.htm"
            }
        )
    },
    @{
        id = "oci-fnd-001-q082"
        domain = "Security and Compliance"
        subtopics = @("MFA และ least privilege")
        difficulty = "medium"
        type = "single"
        scenario = $true
        question = "An organization hires a junior database operator whose sole responsibility is to monitor database backup jobs in the 'Database_Prod' compartment. Instead of granting the operator full tenancy administrator privileges, the security manager crafts a specific IAM policy allowing only `read autonomous-databases` and `inspect backups` in that compartment. Which foundational security concept is being demonstrated?"
        options = @(
            @{ id = "A"; text = "Principle of Least Privilege" },
            @{ id = "B"; text = "Security by Obscurity" },
            @{ id = "C"; text = "Unrestricted Trust Federation" },
            @{ id = "D"; text = "Implicit Access Escalation" }
        )
        correct_answer = @("A")
        explanation = "Principle of Least Privilege (หลักการกำหนดสิทธิ์เท่าที่จำเป็น) คือแนวปฏิบัติด้านความปลอดภัยพื้นฐานที่กำหนดให้ผู้ใช้งานได้รับสิทธิ์เฉพาะเท่าที่จำเป็นต่อการปฏิบัติหน้าที่ของตนเท่านั้น (ในที่นี้คือดูข้อมูลและตรวจสอบการสำรองข้อมูล) ไม่ให้สิทธิ์เกินความจำเป็น เพื่อลดความเสี่ยงจากการกระทำผิดพลาดหรือการถูกขโมยบัญชี
- ตัวเลือก B (Security by Obscurity) คือการซ่อนระบบเพื่อความปลอดภัยซึ่งไม่ใช่วิธีที่ถูกต้อง
- ตัวเลือก C และ D ไม่ใช่หลักการความปลอดภัยที่เป็นมาตรฐาน"
        tags = @("security", "least-privilege", "best-practices", "scenarios")
        references = @(
            @{
                title = "Security Principles"
                url = "https://docs.oracle.com/en-us/iaas/Content/Security/Reference/security_overview.htm"
            }
        )
    },
    @{
        id = "oci-fnd-001-q083"
        domain = "Security and Compliance"
        subtopics = @("Data encryption at rest และ in transit")
        difficulty = "easy"
        type = "single"
        scenario = $false
        question = "What is Oracle Cloud Infrastructure's default policy regarding Data Encryption at Rest across storage services such as Block Volumes, Object Storage, and File Storage?"
        options = @(
            @{ id = "A"; text = "All storage services are encrypted at rest by default using strong AES-256 encryption at zero additional cost to the customer." },
            @{ id = "B"; text = "Data is stored unencrypted unless the customer pays for a premium encryption subscription." },
            @{ id = "C"; text = "Encryption at rest is only supported for MySQL databases, but not for block storage." },
            @{ id = "D"; text = "Customers must write custom scripts to manually encrypt files before writing them to disk." }
        )
        correct_answer = @("A")
        explanation = "บริการจัดเก็บข้อมูลทั้งหมดใน OCI (รวมถึง Block Volume, Boot Volume, Object Storage, File Storage และ Database) จะได้รับการเข้ารหัสข้อมูลขณะพัก (Data Encryption at Rest) โดยค่าเริ่มต้นเสมอ (Default encryption) โดยใช้อัลกอริทึมมาตรฐานสากล Advanced Encryption Standard (AES) ความยาวกุญแจ 256 บิต โดยไม่มีค่าใช้จ่ายเพิ่มเติม
- ตัวเลือก B, C และ D ไม่ถูกต้อง เพราะ OCI เข้ารหัสให้อัตโนมัติทุกบริการสตอเรจโดยไม่มีข้อยกเว้น"
        tags = @("security", "encryption-at-rest", "storage", "compliance")
        references = @(
            @{
                title = "Securing Storage"
                url = "https://docs.oracle.com/en-us/iaas/Content/Security/Reference/storage_security.htm"
            }
        )
    },
    @{
        id = "oci-fnd-001-q084"
        domain = "Security and Compliance"
        subtopics = @("OCI Vault, keys และ secrets ในระดับพื้นฐาน")
        difficulty = "hard"
        type = "single"
        scenario = $true
        question = "A financial corporation is required by banking regulators to retain full cryptographic ownership and control over the encryption keys used to encrypt their cloud database backups. Rather than using Oracle-managed master keys, the corporation must create, rotate, and manage their own master keys stored in certified hardware. Which OCI service provides this capability?"
        options = @(
            @{ id = "A"; text = "OCI Vault (Key Management Service) using Customer-Managed Keys backed by FIPS 140-2 Level 3 certified Hardware Security Modules (HSMs)" },
            @{ id = "B"; text = "OCI Cloud Advisor using open-text free-form tags" },
            @{ id = "C"; text = "OCI Network Security Groups with stateful route rules" },
            @{ id = "D"; text = "OCI Internet Gateway with dynamic peering" }
        )
        correct_answer = @("A")
        explanation = "OCI Vault (หรือ OCI Key Management Service) ช่วยให้องค์กรสามารถสร้าง หมุนเวียน (Rotate) และควบคุมกุญแจเข้ารหัสระดับมาสเตอร์ (Master Encryption Keys) ได้ด้วยตนเอง (Customer-Managed Keys / Bring Your Own Key - BYOK) โดยกุญแจจะถูกจัดเก็บและประมวลผลอย่างปลอดภัยภายในอุปกรณ์ Hardware Security Modules (HSMs) ที่ผ่านการรับรองมาตรฐาน FIPS 140-2 Level 3
- ตัวเลือก B, C และ D ไม่ใช่บริการสำหรับการจัดการกุญแจเข้ารหัส"
        tags = @("security", "vault", "kms", "customer-managed-keys", "compliance")
        references = @(
            @{
                title = "Overview of Vault"
                url = "https://docs.oracle.com/en-us/iaas/Content/KeyManagement/Concepts/keyoverview.htm"
            }
        )
    },
    @{
        id = "oci-fnd-001-q085"
        domain = "Security and Compliance"
        subtopics = @("OCI Vault, keys และ secrets ในระดับพื้นฐาน")
        difficulty = "easy"
        type = "single"
        scenario = $false
        question = "What is the primary function of OCI Vault Secrets Management?"
        options = @(
            @{ id = "A"; text = "Securely storing, organizing, and versioning sensitive text-based data such as database passwords, API authentication tokens, and TLS certificates." },
            @{ id = "B"; text = "Compressing video files stored in Object Storage buckets." },
            @{ id = "C"; text = "Automatically paying corporate credit card invoices." },
            @{ id = "D"; text = "Generating random domain names for public subnets." }
        )
        correct_answer = @("A")
        explanation = "OCI Vault Secrets Management เป็นฟีเจอร์สำหรับจัดเก็บและจัดการข้อมูลที่เป็นความลับ (Sensitive data) เช่น รหัสผ่านฐานข้อมูล, API Tokens, Private Keys และใบรับรองความปลอดภัย โดยข้อมูลความลับจะถูกเข้ารหัสด้วย Master Encryption Key ใน Vault และรองรับการทำ Versioning รวมถึงการเรียกใช้งานผ่าน IAM Policies และ APIs
- ตัวเลือก B, C และ D ไม่เกี่ยวข้องกับการทำงานของ Vault Secrets"
        tags = @("security", "vault", "secrets", "passwords")
        references = @(
            @{
                title = "Overview of Vault Secrets"
                url = "https://docs.oracle.com/en-us/iaas/Content/KeyManagement/Concepts/keyoverview.htm"
            }
        )
    },
    @{
        id = "oci-fnd-001-q086"
        domain = "Security and Compliance"
        subtopics = @("Cloud Guard, Security Zones และ WAF ในระดับ Foundations")
        difficulty = "medium"
        type = "single"
        scenario = $true
        question = "A chief information security officer wants to continuously monitor the company's OCI tenancy for configuration vulnerabilities and security misconfigurations (such as public buckets or open SSH ports) and automatically trigger remediation actions to disable the insecure resource. Which OCI service provides this continuous posture management?"
        options = @(
            @{ id = "A"; text = "OCI Cloud Guard" },
            @{ id = "B"; text = "OCI Load Balancer" },
            @{ id = "C"; text = "OCI Cloud Shell" },
            @{ id = "D"; text = "OCI FastConnect" }
        )
        correct_answer = @("A")
        explanation = "OCI Cloud Guard เป็นบริการตรวจจับและบริหารจัดการความปลอดภัยของคลาวด์ (Cloud Security Posture Management - CSPM) ที่ตรวจสอบ Tenancy แบบต่อเนื่องผ่าน Detector Recipes (ตรวจจับความเสี่ยง เช่น Bucket ถูกเปิดสาธารณะ หรือ Security List เปิด Port 22 กว้าง) และสามารถสั่งการแก้ไขปัญหาได้โดยอัตโนมัติผ่าน Responder Recipes
- ตัวเลือก B, C และ D ไม่ใช่บริการตรวจจับความเสี่ยงและการตั้งค่าความปลอดภัยของ Tenancy"
        tags = @("security", "cloud-guard", "cspm", "remediation", "scenarios")
        references = @(
            @{
                title = "Cloud Guard Overview"
                url = "https://docs.oracle.com/en-us/iaas/cloud-guard/using/overview.htm"
            }
        )
    },
    @{
        id = "oci-fnd-001-q087"
        domain = "Security and Compliance"
        subtopics = @("Cloud Guard, Security Zones และ WAF ในระดับ Foundations")
        difficulty = "hard"
        type = "single"
        scenario = $true
        question = "An enterprise requires an ironclad security perimeter where non-compliant security actions (such as creating a public Object Storage bucket or provisioning an unencrypted volume) are strictly prevented and rejected at the API call stage, ensuring that resources within the designated compartment are secure from the moment of creation. Which OCI feature provides this preventive enforcement?"
        options = @(
            @{ id = "A"; text = "OCI Security Zones" },
            @{ id = "B"; text = "OCI Cost Analysis" },
            @{ id = "C"; text = "OCI Service Limits" },
            @{ id = "D"; text = "OCI Free-form Tags" }
        )
        correct_answer = @("A")
        explanation = "OCI Security Zones ทำหน้าที่เป็นเกราะป้องกันเชิงรุก (Preventive Security) โดยผูก Compartment เข้ากับ Security Zone Recipe เมื่อมีผู้ใช้พยายามสร้างหรือแก้ไขทรัพยากรที่ไม่สอดคล้องกับนโยบายความปลอดภัย (เช่น พยายามสร้าง Bucket สาธารณะ หรือสร้าง Volume โดยไม่เข้ารหัสด้วย Customer Key) ระบบจะทำการบล็อกและปฏิเสธคำสั่งนั้นทันทีตั้งแต่ระดับ API
- แตกต่างจาก Cloud Guard ที่เป็น Detective (ตรวจพบหลังสร้างแล้วจึงแจ้งเตือน/แก้ไข) ส่วน Security Zone จะป้องกันตั้งแต่ก่อนสร้างสำเร็จ
- ตัวเลือก B, C และ D ไม่ใช่เครื่องมือบังคับนโยบายความปลอดภัยเชิงรุก"
        tags = @("security", "security-zones", "governance", "preventive-security")
        references = @(
            @{
                title = "Overview of Security Zones"
                url = "https://docs.oracle.com/en-us/iaas/security-zone/using/overview.htm"
            }
        )
    },
    @{
        id = "oci-fnd-001-q088"
        domain = "Security and Compliance"
        subtopics = @("Cloud Guard, Security Zones และ WAF ในระดับ Foundations")
        difficulty = "medium"
        type = "single"
        scenario = $false
        question = "What is the primary role of the OCI Web Application Firewall (WAF) service?"
        options = @(
            @{ id = "A"; text = "Protecting public web-facing applications from Layer 7 cyber threats, including OWASP Top 10 vulnerabilities (such as SQL Injection and Cross-Site Scripting), bot attacks, and HTTP DDoS." },
            @{ id = "B"; text = "Filtering internal ICMP ping packets between private database subnets." },
            @{ id = "C"; text = "Assigning private IPv4 addresses to Linux host network cards." },
            @{ id = "D"; text = "Managing physical building access keycards for Oracle employees." }
        )
        correct_answer = @("A")
        explanation = "OCI Web Application Firewall (WAF) เป็นบริการรักษาความปลอดภัยระดับเลเยอร์แอปพลิเคชัน (Layer 7) ที่ทำหน้าที่ตรวจสอบและคัดกรองทราฟฟิก HTTP/HTTPS ก่อนถึงเว็บเซิร์ฟเวอร์ เพื่อปกป้องเว็บแอปพลิเคชันจากการโจมตีตามมาตรฐาน OWASP Top 10 (เช่น SQL Injection, Cross-Site Scripting - XSS), บอทที่เป็นอันตราย (Malicious Bots) และการโจมตีแบบ Layer 7 DDoS
- ตัวเลือก B, C และ D ไม่ใช่หน้าที่ของ Web Application Firewall"
        tags = @("security", "waf", "layer-7", "owasp", "web-security")
        references = @(
            @{
                title = "Overview of Web Application Firewall"
                url = "https://docs.oracle.com/en-us/iaas/Content/WAF/Concepts/overview.htm"
            }
        )
    },
    @{
        id = "oci-fnd-001-q089"
        domain = "Security and Compliance"
        subtopics = @("Compliance และ auditing ในระดับแนวคิด")
        difficulty = "medium"
        type = "multiple"
        scenario = $false
        question = "Which TWO statements correctly describe the default operational characteristics of the OCI Audit Service? (Choose TWO)"
        options = @(
            @{ id = "A"; text = "It automatically records all public API calls made to supported OCI services across the tenancy as structured JSON event records." },
            @{ id = "B"; text = "Audit log records are immutable and are automatically retained for 365 days by default." },
            @{ id = "C"; text = "The Audit service must be manually installed as software on each compute instance's guest operating system." },
            @{ id = "D"; text = "Customers can disable the Audit service at any time to reduce monthly storage costs." },
            @{ id = "E"; text = "Audit records are deleted every 24 hours to maximize disk space." }
        )
        correct_answer = @("A", "B")
        explanation = "คุณลักษณะของ OCI Audit Service:
- (A) ระบบจะบันทึกการเรียกใช้ OCI API ทั้งหมดใน Tenancy โดยอัตโนมัติในรูปแบบ JSON events ครอบคลุมทั้งการกระทำผ่าน Console, CLI, SDK และ REST API
- (B) ข้อมูลใน Audit Log ไม่สามารถแก้ไขหรือลบได้ (Immutable) และถูกจัดเก็บไว้นาน 365 วัน (1 ปี) เป็นค่าเริ่มต้นเพื่อรองรับการตรวจสอบย้อนหลังและการปฏิบัติตามกฎหมาย
- ตัวเลือก C ผิด เพราะ Audit เป็นบริการระดับแพลตฟอร์ม ไม่ต้องติดตั้งบน VM
- ตัวเลือก D ผิด เพราะ Audit Service เปิดทำงานตลอดเวลาโดยอัตโนมัติและไม่สามารถปิดได้
- ตัวเลือก E ผิด เพราะเก็บไว้นานถึง 365 วัน"
        tags = @("security", "audit", "compliance", "logging")
        references = @(
            @{
                title = "Overview of Audit"
                url = "https://docs.oracle.com/en-us/iaas/Content/Audit/Concepts/auditoverview.htm"
            }
        )
    },
    @{
        id = "oci-fnd-001-q090"
        domain = "Security and Compliance"
        subtopics = @("Shared security responsibility")
        difficulty = "hard"
        type = "multiple"
        scenario = $true
        question = "An IT compliance auditor is evaluating an organization's cloud deployment on OCI under the Shared Security Responsibility Model. Which TWO infrastructure security controls are strictly managed and maintained by Oracle? (Choose TWO)"
        options = @(
            @{ id = "A"; text = "Physical perimeter security, biometric access controls, and video surveillance at Oracle cloud data centers" },
            @{ id = "B"; text = "Hypervisor software security, host server firmware updates, and physical hardware decommissioning" },
            @{ id = "C"; text = "Configuration of customer IAM passwords and multi-factor authentication policies" },
            @{ id = "D"; text = "Granting least-privilege IAM policies to third-party contractors" },
            @{ id = "E"; text = "Installing security patches inside customer compute virtual machine operating systems" }
        )
        correct_answer = @("A", "B")
        explanation = "ภายใต้ Shared Security Responsibility Model ผู้ให้บริการคลาวด์ (Oracle) จะรับผิดชอบ 'Security OF the Cloud' ซึ่งรวมถึง:
- (A) ความปลอดภัยทางกายภาพของศูนย์ข้อมูล เช่น การควบคุมการเข้าออกด้วยระบบชีวมิติ กล้องวงจรปิด และ รปภ.
- (B) ความปลอดภัยของระบบ Hypervisor, เฟิร์มแวร์ของเซิร์ฟเวอร์ และการทำลายฮาร์ดแวร์ที่หมดอายุอย่างปลอดภัย
- ตัวเลือก C, D, และ E เป็นความรับผิดชอบของลูกค้า ('Security IN the Cloud') เช่น การตั้งค่ารหัสผ่าน IAM, การกำหนด Policy สิทธิ์ และการลงแพตช์ OS บนเครื่อง VM"
        tags = @("security", "shared-responsibility", "compliance")
        references = @(
            @{
                title = "Overview of Security in OCI"
                url = "https://docs.oracle.com/en-us/iaas/Content/Security/Reference/security_overview.htm"
            }
        )
    }
)
