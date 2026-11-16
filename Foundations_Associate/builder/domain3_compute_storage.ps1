# Domain 3 Part 1: Compute, Containers, Serverless & Storage (19 questions: Q031 - Q049)
# 15 single, 4 multiple (Q036, Q040, Q047, Q049)
# Difficulty: 5 easy, 9 medium, 5 hard
# Scenarios: 12 true, 7 false

$domain3_p1 = @(
    @{
        id = "oci-fnd-001-q031"
        domain = "Core OCI Services"
        subtopics = @("Compute: shapes, images, instance pools, autoscaling และเบื้องต้นของ bare metal/VM")
        difficulty = "easy"
        type = "single"
        scenario = $false
        question = "What is the primary advantage of selecting an OCI Flexible (Flex) compute shape over a fixed standard compute shape?"
        options = @(
            @{ id = "A"; text = "It allows administrators to independently customize the exact number of OCPUs and amount of memory (RAM) allocated to a virtual machine." },
            @{ id = "B"; text = "It provides free unlimited block volume storage attached to the compute instance." },
            @{ id = "C"; text = "It automatically changes the physical server motherboard every 30 days." },
            @{ id = "D"; text = "It completely eliminates the need for an underlying operating system." }
        )
        correct_answer = @("A")
        explanation = "OCI Flexible (Flex) Shapes ช่วยให้ผู้ใช้งานสามารถปรับแต่งจำนวน OCPU และปริมาณ RAM ได้อย่างอิสระและยืดหยุ่นตามความต้องการที่แท้จริงของเวิร์กโหลด ทำให้ไม่ต้องจ่ายเงินเผื่อสเปกแบบ Fixed Shape แบบเดิม จึงช่วยประหยัดค่าใช้จ่ายได้มาก
- ตัวเลือก B ผิด สตอเรจคิดค่าบริการแยกต่างหาก ไม่ได้ให้ฟรีไม่จำกัด
- ตัวเลือก C และ D ไม่ถูกต้องตามหลักการทำงานของ Flex Shape"
        tags = @("core-services", "compute", "flex-shapes")
        references = @(
            @{
                title = "Compute Shapes"
                url = "https://docs.oracle.com/en-us/iaas/Content/Compute/References/computeshapes.htm"
            }
        )
    },
    @{
        id = "oci-fnd-001-q032"
        domain = "Core OCI Services"
        subtopics = @("Compute: shapes, images, instance pools, autoscaling และเบื้องต้นของ bare metal/VM")
        difficulty = "medium"
        type = "single"
        scenario = $true
        question = "A high-frequency algorithmic trading company requires maximum compute performance, direct hardware access to underlying physical memory and network interfaces, and zero virtualization hypervisor overhead. Which OCI compute offering directly addresses these requirements?"
        options = @(
            @{ id = "A"; text = "OCI Bare Metal Instances" },
            @{ id = "B"; text = "OCI Standard Virtual Machines" },
            @{ id = "C"; text = "OCI Container Instances" },
            @{ id = "D"; text = "OCI Serverless Functions" }
        )
        correct_answer = @("A")
        explanation = "OCI Bare Metal Instances คือเซิร์ฟเวอร์ฮาร์ดแวร์จริงที่ให้สิทธิ์ลูกค้าควบคุมทั้งเครื่องแต่เพียงผู้เดียว (Single-tenant) โดยไม่มี Hypervisor มาคั่น ทำให้ได้ประสิทธิภาพสูงสุด (Raw hardware performance), ไม่เกิด Noisy neighbor effect และมี I/O Latency ต่ำที่สุด เหมาะสำหรับเวิร์กโหลดการเงินและการคำนวณขั้นสูง
- ตัวเลือก B (Virtual Machines) ทำงานอยู่บน Hypervisor จึงมี Overhead เล็กน้อย
- ตัวเลือก C และ D เป็นบริการจัดการคอนเทนเนอร์และเซิร์ฟเวอร์เลส ไม่ใช่เซิร์ฟเวอร์กายภาพแบบ Bare Metal"
        tags = @("core-services", "compute", "bare-metal", "scenarios")
        references = @(
            @{
                title = "Overview of the Compute Service"
                url = "https://docs.oracle.com/en-us/iaas/Content/Compute/Concepts/computeoverview.htm"
            }
        )
    },
    @{
        id = "oci-fnd-001-q033"
        domain = "Core OCI Services"
        subtopics = @("Compute: shapes, images, instance pools, autoscaling และเบื้องต้นของ bare metal/VM")
        difficulty = "medium"
        type = "single"
        scenario = $true
        question = "An engineering team manages a web application that experiences variable traffic patterns throughout the workweek. Which combination of OCI Compute features enables the application to automatically add or remove identical VM instances based on real-time CPU utilization metrics?"
        options = @(
            @{ id = "A"; text = "Instance Configurations, Instance Pools, and Autoscaling Configurations" },
            @{ id = "B"; text = "Dynamic Routing Gateways and Security Lists" },
            @{ id = "C"; text = "Pre-Authenticated Requests and Bucket Replication" },
            @{ id = "D"; text = "Vault Key Management and Cloud Guard Responders" }
        )
        correct_answer = @("A")
        explanation = "การทำ Autoscaling บน OCI Compute ทำงานร่วมกัน 3 องค์ประกอบ:
1. Instance Configuration: เทมเพลตแม่แบบที่กำหนด Shape, OS Image และการตั้งค่าของ VM
2. Instance Pool: กลุ่มของ Compute Instances ที่สร้างขึ้นจาก Instance Configuration เดียวกัน
3. Autoscaling Configuration: นโยบายที่คอยตรวจสอบ Metrics (เช่น CPU หรือ Memory) เพื่อสั่งเพิ่มหรือลดจำนวน Instance ใน Pool โดยอัตโนมัติ
- ตัวเลือก B, C และ D เป็นบริการด้านเครือข่าย สตอเรจ และความปลอดภัย ไม่เกี่ยวข้องกับการขยายขนาด Compute"
        tags = @("core-services", "compute", "autoscaling", "instance-pools")
        references = @(
            @{
                title = "Autoscaling Overview"
                url = "https://docs.oracle.com/en-us/iaas/Content/Compute/Tasks/autoscalinginstancepools.htm"
            }
        )
    },
    @{
        id = "oci-fnd-001-q034"
        domain = "Core OCI Services"
        subtopics = @("Compute: shapes, images, instance pools, autoscaling และเบื้องต้นของ bare metal/VM")
        difficulty = "easy"
        type = "single"
        scenario = $false
        question = "What is an OCI Custom Image, and how is it primarily utilized by system administrators?"
        options = @(
            @{ id = "A"; text = "A golden master template captured from an existing compute instance's boot disk, used to launch identical virtual machines pre-configured with software and customizations." },
            @{ id = "B"; text = "An automated graphic diagram that visualizes network subnet topology in the OCI Console." },
            @{ id = "C"; text = "A digital badge issued to users who pass the Oracle certification examination." },
            @{ id = "D"; text = "A read-only backup copy of an Autonomous Data Warehouse schema." }
        )
        correct_answer = @("A")
        explanation = "OCI Custom Image คืออิมเมจระบบปฏิบัติการต้นแบบ (Golden master image) ที่บันทึกมาจาก Boot Disk ของ Compute Instance ที่มีการติดตั้งและปรับแต่งซอฟต์แวร์ไว้เรียบร้อยแล้ว เพื่อนำไปใช้สร้าง Instance ใหม่ ๆ ให้เหมือนกันได้อย่างรวดเร็วโดยไม่ต้องเสียเวลาติดตั้งโปรแกรมซ้ำ
- ตัวเลือก B คือ Network Visualizer ไม่ใช่ Custom Image
- ตัวเลือก C และ D ไม่เกี่ยวข้องกับ Custom Image ของระบบ Compute"
        tags = @("core-services", "compute", "custom-images")
        references = @(
            @{
                title = "Managing Custom Images"
                url = "https://docs.oracle.com/en-us/iaas/Content/Compute/Tasks/managingcustomimages.htm"
            }
        )
    },
    @{
        id = "oci-fnd-001-q035"
        domain = "Core OCI Services"
        subtopics = @("Compute: shapes, images, instance pools, autoscaling และเบื้องต้นของ bare metal/VM")
        difficulty = "medium"
        type = "single"
        scenario = $true
        question = "A bioinformatics research team runs large-scale, fault-tolerant batch simulations that can be paused and restarted at any time without data corruption. To dramatically reduce compute costs by up to 50% compared to standard on-demand pricing, which OCI Compute instance type should they deploy?"
        options = @(
            @{ id = "A"; text = "Preemptible Instances" },
            @{ id = "B"; text = "Dedicated Virtual Machine Hosts" },
            @{ id = "C"; text = "Bare Metal DenseIO Instances" },
            @{ id = "D"; text = "High-Memory Exadata Cloud Instances" }
        )
        correct_answer = @("A")
        explanation = "Preemptible Instances คือ Compute Instances ที่ OCI นำทรัพยากรว่างมาให้บริการในราคาที่ถูกลงอย่างมาก (ประหยัดได้สูงสุดถึง 50% เมื่อเทียบกับราคาปกติ) โดยมีเงื่อนไขว่า OCI สามารถดึงทรัพยากรคืน (Reclaim) ได้เมื่อมีความต้องการใช้งานจากผู้ใช้บริการปกติ จึงเหมาะอย่างยิ่งกับงาน Batch Processing, การทดสอบ, หรืองานวิจัยที่สามารถทนต่อการหยุดชะงักได้
- ตัวเลือก B (Dedicated Hosts) มีราคาสูงเพื่อเน้นความเป็นส่วนตัวของฮาร์ดแวร์
- ตัวเลือก C และ D เป็นอินสแตนซ์สเปกสูงพิเศษสำหรับงานฐานข้อมูล ไม่ได้ออกแบบมาเพื่อประหยัดต้นทุนงาน Batch"
        tags = @("core-services", "compute", "preemptible-instances", "cost-saving")
        references = @(
            @{
                title = "Preemptible Instances"
                url = "https://docs.oracle.com/en-us/iaas/Content/Compute/Concepts/preemptible.htm"
            }
        )
    },
    @{
        id = "oci-fnd-001-q036"
        domain = "Core OCI Services"
        subtopics = @("Containers และ serverless: OKE, Container Instances และ Functions ในระดับ Foundations")
        difficulty = "medium"
        type = "multiple"
        scenario = $false
        question = "Which TWO characteristics accurately describe Oracle Functions within OCI's serverless application portfolio? (Choose TWO)"
        options = @(
            @{ id = "A"; text = "It is a fully managed, event-driven serverless compute service powered by the open-source Fn Project engine." },
            @{ id = "B"; text = "Customers are billed exclusively for the precise execution duration and memory allocated during function runtime." },
            @{ id = "C"; text = "Customers must maintain and patch the underlying Linux hypervisor hosts running the functions." },
            @{ id = "D"; text = "Functions run continuously 24/7 and cannot be triggered by external event notifications." },
            @{ id = "E"; text = "Functions require provisioned dedicated bare metal servers to be permanently online." }
        )
        correct_answer = @("A", "B")
        explanation = "คุณลักษณะของ Oracle Functions:
- (A) เป็นบริการ Serverless Compute ที่จัดการให้แบบเบ็ดเสร็จ (Fully managed) ขับเคลื่อนด้วยระบบโอเพนซอร์ส Fn Project ทำงานตามเหตุการณ์ (Event-driven)
- (B) คิดค่าบริการตามเวลาที่รันฟังก์ชันจริง (Execution duration) และปริมาณ Memory ที่ใช้เท่านั้น เมื่อฟังก์ชันไม่ทำงานจะไม่เสียค่าใช้จ่าย
- ตัวเลือก C ผิด เพราะ Oracle เป็นผู้ดูแลจัดการเซิร์ฟเวอร์และ OS ทั้งหมด
- ตัวเลือก D ผิด เพราะ Functions ทำงานแบบ On-demand และถูกกระตุ้นผ่าน Events หรือ API
- ตัวเลือก E ผิด เพราะไม่ต้องจองหรือเปิดเซิร์ฟเวอร์ Bare Metal ทิ้งไว้"
        tags = @("core-services", "serverless", "functions")
        references = @(
            @{
                title = "Overview of Functions"
                url = "https://docs.oracle.com/en-us/iaas/Content/Functions/Concepts/functionsoverview.htm"
            }
        )
    },
    @{
        id = "oci-fnd-001-q037"
        domain = "Core OCI Services"
        subtopics = @("Containers และ serverless: OKE, Container Instances และ Functions ในระดับ Foundations")
        difficulty = "hard"
        type = "single"
        scenario = $true
        question = "A developer wants to quickly run a containerized microservice without having to provision, configure, or manage Kubernetes control planes, worker nodes, or node pools. Which OCI service provides this serverless container deployment capability?"
        options = @(
            @{ id = "A"; text = "OCI Container Instances" },
            @{ id = "B"; text = "Oracle Container Engine for Kubernetes (OKE)" },
            @{ id = "C"; text = "OCI Bare Metal Compute" },
            @{ id = "D"; text = "OCI Block Volume Clones" }
        )
        correct_answer = @("A")
        explanation = "OCI Container Instances คือบริการรันคอนเทนเนอร์แบบ Serverless ที่ช่วยให้ผู้ใช้สามารถนำ Container Image มารันได้ทันทีภายในไม่กี่วินาที โดยไม่ต้องสร้างหรือดูแลเซิร์ฟเวอร์ และไม่ต้องบริหารจัดการคลัสเตอร์ Kubernetes แต่อย่างใด
- ตัวเลือก B (OKE) เหมาะสำหรับระบบที่ต้องการฟีเจอร์ระดับสูงของ Kubernetes (Orchestration, Ingress, Pod autoscaling) แต่ผู้ใช้ต้องบริหารจัดการ Node Pools และ Cluster
- ตัวเลือก C ต้องดูแลระบบปฏิบัติการและการลง Docker เอง
- ตัวเลือก D เป็นบริการสตอเรจ ไม่ใช่การรันคอนเทนเนอร์"
        tags = @("core-services", "containers", "container-instances", "scenarios")
        references = @(
            @{
                title = "Container Instances Overview"
                url = "https://docs.oracle.com/en-us/iaas/Content/container-instances/overview.htm"
            }
        )
    },
    @{
        id = "oci-fnd-001-q038"
        domain = "Core OCI Services"
        subtopics = @("Compute: shapes, images, instance pools, autoscaling และเบื้องต้นของ bare metal/VM")
        difficulty = "hard"
        type = "single"
        scenario = $true
        question = "A regulated healthcare enterprise must comply with federal compliance guidelines requiring that their virtual machines run on physically isolated server hardware that is dedicated strictly to their organization and never shared with other tenants. Which OCI compute service meets this compliance requirement?"
        options = @(
            @{ id = "A"; text = "Dedicated Virtual Machine Hosts (DVH)" },
            @{ id = "B"; text = "Standard Multi-tenant Virtual Machines" },
            @{ id = "C"; text = "Serverless Cloud Functions" },
            @{ id = "D"; text = "Shared Flexible Compute Instances" }
        )
        correct_answer = @("A")
        explanation = "Dedicated Virtual Machine Hosts (DVH) ให้บริการฮาร์ดแวร์เซิร์ฟเวอร์แบบเฉพาะเจาะจงแก่ลูกค้ารายเดียว (Single-tenant) โดยลูกค้าสามารถสร้างและรัน Virtual Machines หลายตัวบนโฮสต์ของตนเองได้ ซึ่งตอบสนองข้อกำหนดทางกฎหมายที่ห้ามแชร์ฮาร์ดแวร์ทางกายภาพร่วมกับลูกค้ารายอื่น (No multi-tenancy at physical layer)
- ตัวเลือก B และ D รันบนโฮสต์ที่มีการแชร์ฮาร์ดแวร์ร่วมกับผู้ใช้อื่น (Multi-tenant)
- ตัวเลือก C (Functions) ทำงานบนโครงสร้างพื้นฐานแบบแชร์ทรัพยากร"
        tags = @("core-services", "compute", "dedicated-hosts", "compliance")
        references = @(
            @{
                title = "Dedicated Virtual Machine Hosts"
                url = "https://docs.oracle.com/en-us/iaas/Content/Compute/Concepts/dedicatedvms.htm"
            }
        )
    },
    @{
        id = "oci-fnd-001-q039"
        domain = "Core OCI Services"
        subtopics = @("Compute: shapes, images, instance pools, autoscaling และเบื้องต้นของ bare metal/VM")
        difficulty = "medium"
        type = "single"
        scenario = $false
        question = "What is the primary function of OCI OS Management Hub (formerly OS Management Service) for compute instances?"
        options = @(
            @{ id = "A"; text = "Automating security patch management, package updates, and operating system vulnerability reporting across fleets of Linux and Windows instances." },
            @{ id = "B"; text = "Dynamically converting x86 processor instructions into ARM architecture at runtime." },
            @{ id = "C"; text = "Hosting public DNS records for internet domain names." },
            @{ id = "D"; text = "Providing automated physical cleaning schedules for data center chassis fans." }
        )
        correct_answer = @("A")
        explanation = "OCI OS Management Hub ช่วยให้ผู้ดูแลระบบสามารถบริหารจัดการและควบคุมระบบปฏิบัติการของ Compute Instances (ทั้ง Linux และ Windows) ได้จากศูนย์กลางแบบอัตโนมัติ รวมถึงการตรวจสอบช่องโหว่ความปลอดภัย, การลงแพตช์ (Patch management), และการอัปเดตแพ็กเกจซอฟต์แวร์
- ตัวเลือก B, C และ D ไม่เกี่ยวข้องกับหน้าที่ของ OS Management Hub"
        tags = @("core-services", "compute", "os-management", "operations")
        references = @(
            @{
                title = "OS Management Hub Overview"
                url = "https://docs.oracle.com/en-us/iaas/os-management-hub/doc/overview.htm"
            }
        )
    },
    @{
        id = "oci-fnd-001-q040"
        domain = "Core OCI Services"
        subtopics = @("Compute: shapes, images, instance pools, autoscaling และเบื้องต้นของ bare metal/VM")
        difficulty = "hard"
        type = "multiple"
        scenario = $true
        question = "An operations engineer is configuring metric-based autoscaling policies for an OCI Instance Pool hosting a scalable web application. Which TWO system performance metrics can be directly selected to trigger horizontal scale-out and scale-in events? (Choose TWO)"
        options = @(
            @{ id = "A"; text = "CPU Utilization" },
            @{ id = "B"; text = "Memory Utilization" },
            @{ id = "C"; text = "Data center ambient air temperature" },
            @{ id = "D"; text = "Tenancy credit card balance remaining" },
            @{ id = "E"; text = "Number of active support tickets open in My Oracle Support" }
        )
        correct_answer = @("A", "B")
        explanation = "ในการตั้งค่านโยบาย Metric-based Autoscaling สำหรับ Instance Pool บน OCI สามารถใช้ตัวชี้วัดประสิทธิภาพของระบบ ได้แก่:
- (A) CPU Utilization (เปอร์เซ็นต์การใช้งานซีพียู)
- (B) Memory Utilization (เปอร์เซ็นต์การใช้งานหน่วยความจำ)
เมื่อค่าเฉลี่ยของ Instance ใน Pool สูงหรือต่ำกว่าเกณฑ์ที่กำหนด ระบบจะสั่งเพิ่มหรือลดจำนวน Instance ให้โดยอัตโนมัติ
- ตัวเลือก C, D, และ E ไม่ใช่ตัวชี้วัดประสิทธิภาพของระบบคอมพิวเตอร์ที่นำมาใช้ทำ Autoscaling"
        tags = @("core-services", "compute", "autoscaling", "metrics")
        references = @(
            @{
                title = "Autoscaling Policies"
                url = "https://docs.oracle.com/en-us/iaas/Content/Compute/Tasks/autoscalinginstancepools.htm"
            }
        )
    },
    @{
        id = "oci-fnd-001-q041"
        domain = "Core OCI Services"
        subtopics = @("Block Volume และ Boot Volume", "Object Storage: namespaces, buckets, objects, storage tiers และ lifecycle rules")
        difficulty = "easy"
        type = "single"
        scenario = $false
        question = "What is the primary structural difference between OCI Block Volume and OCI Object Storage?"
        options = @(
            @{ id = "A"; text = "Block Volume provides raw, unformatted network-attached block storage accessed via iSCSI or paravirtualized modes by compute instances, whereas Object Storage is an internet-scale unstructured data store accessed over HTTP/HTTPS APIs." },
            @{ id = "B"; text = "Block Volume is used only for archival backups, whereas Object Storage is mounted as the primary boot disk for virtual machines." },
            @{ id = "C"; text = "Block Volume stores data as objects with metadata, whereas Object Storage provides physical floppy disks." },
            @{ id = "D"; text = "Object Storage requires instances to be deployed in the same Availability Domain, whereas Block Volume is automatically accessible across all continents." }
        )
        correct_answer = @("A")
        explanation = "ความแตกต่างระหว่าง Block Volume และ Object Storage:
- Block Volume เป็นสตอเรจระดับบล็อก (Raw block storage) ที่เชื่อมต่อเข้ากับ Compute Instance ผ่านโปรโตคอลเครือข่ายเสมือน (iSCSI หรือ Paravirtualized) เพื่อทำหน้าที่เป็น Boot Volume หรือดิสก์เก็บข้อมูลสำหรับระบบไฟล์
- Object Storage เป็นพื้นที่จัดเก็บข้อมูลแบบไม่มีโครงสร้าง (Unstructured data) ขนาดใหญ่ระดับอินเทอร์เน็ต สามารถเข้าถึงได้จากทุกที่ผ่าน HTTPS REST APIs โดยเก็บข้อมูลในรูปของ Object ภายใน Bucket
- ตัวเลือก B, C, และ D อธิบายสลับกันหรือให้ข้อมูลที่ผิดพลาด"
        tags = @("core-services", "block-volume", "object-storage", "storage")
        references = @(
            @{
                title = "Block Volume Overview"
                url = "https://docs.oracle.com/en-us/iaas/Content/Block/Concepts/overview.htm"
            }
        )
    },
    @{
        id = "oci-fnd-001-q042"
        domain = "Core OCI Services"
        subtopics = @("Object Storage: namespaces, buckets, objects, storage tiers และ lifecycle rules")
        difficulty = "medium"
        type = "single"
        scenario = $true
        question = "A compliance officer requires historical audit PDF records to be preserved for seven years. The records are accessed rarely, perhaps once per year, and the organization can comfortably wait a few hours to retrieve them when requested. Which OCI Object Storage tier offers the lowest storage cost for this use case?"
        options = @(
            @{ id = "A"; text = "Archive Storage" },
            @{ id = "B"; text = "Standard Object Storage" },
            @{ id = "C"; text = "Higher Performance Block Volume" },
            @{ id = "D"; text = "File Storage Service" }
        )
        correct_answer = @("A")
        explanation = "Archive Storage เป็น Tier ของ Object Storage ที่มีค่าใช้จ่ายในการจัดเก็บข้อมูลต่ำที่สุด (Lowest storage cost) เหมาะสำหรับข้อมูลที่มีการเข้าถึงน้อยมาก นาน ๆ ครั้ง (Rarely accessed data) เช่น ข้อมูลการตรวจสอบย้อนหลังทางกฎหมาย โดยมีเงื่อนไขว่าเมื่อต้องการอ่านข้อมูล จะต้องทำคำขอ Restore ล่วงหน้า (ใช้เวลาประมาณ 1 ชั่วโมงขึ้นไป) ก่อนจะดาวน์โหลดได้
- ตัวเลือก B (Standard) เหมาะสำหรับข้อมูลที่เรียกใช้บ่อย เข้าถึงได้ทันทีแบบ Real-time แต่ค่าจัดเก็บต่อ GB สูงกว่า
- ตัวเลือก C และ D มีค่าใช้จ่ายต่อ GB สูงกว่ามากและไม่ใช่สตอเรจสำหรับการสำรองระยะยาว"
        tags = @("core-services", "object-storage", "archive-storage", "storage-tiers")
        references = @(
            @{
                title = "Overview of Object Storage Tiers"
                url = "https://docs.oracle.com/en-us/iaas/Content/Object/Concepts/understandingstoragetiers.htm"
            }
        )
    },
    @{
        id = "oci-fnd-001-q043"
        domain = "Core OCI Services"
        subtopics = @("Object Storage: namespaces, buckets, objects, storage tiers และ lifecycle rules")
        difficulty = "medium"
        type = "single"
        scenario = $true
        question = "A media production agency stores high-resolution raw video footage in an OCI Object Storage bucket. The footage is actively processed during the first 30 days, after which it is rarely accessed but must be retained for one year before being permanently deleted. How can the agency automate this entire process without manual human intervention?"
        options = @(
            @{ id = "A"; text = "Create an Object Lifecycle Management rule that automatically transitions objects from Standard tier to Archive tier after 30 days and deletes them after 365 days." },
            @{ id = "B"; text = "Deploy an OCI Functions script scheduled to run every second to re-upload files manually." },
            @{ id = "C"; text = "Configure a Dynamic Routing Gateway to route expired video packets to the Internet Gateway." },
            @{ id = "D"; text = "Convert the bucket into an NFS mount point using File Storage Service." }
        )
        correct_answer = @("A")
        explanation = "Object Lifecycle Management ช่วยให้สามารถกำหนดกฎอัตโนมัติ (Lifecycle Rules) บน Bucket ได้ เช่น:
1. ปรับเปลี่ยน Tier จาก Standard ไปยัง Archive Storage เมื่ออ็อบเจกต์มีอายุครบ 30 วันเพื่อลดค่าใช้จ่าย
2. สั่งลบอ็อบเจกต์ (Delete) ทิ้งโดยอัตโนมัติเมื่อครบ 365 วัน โดยไม่ต้องอาศัยคนหรือเขียนสคริปต์ภายนอก
- ตัวเลือก B ซับซ้อน สิ้นเปลือง และเสี่ยงต่อข้อผิดพลาด
- ตัวเลือก C และ D ไม่เกี่ยวข้องกับการจัดการวงจรอายุข้อมูลใน Object Storage"
        tags = @("core-services", "object-storage", "lifecycle-rules", "scenarios")
        references = @(
            @{
                title = "Managing Object Lifecycle"
                url = "https://docs.oracle.com/en-us/iaas/Content/Object/Tasks/usinglifecyclepolicies.htm"
            }
        )
    },
    @{
        id = "oci-fnd-001-q044"
        domain = "Core OCI Services"
        subtopics = @("Block Volume และ Boot Volume")
        difficulty = "easy"
        type = "single"
        scenario = $false
        question = "How can a system administrator dynamically adjust the performance and input/output per second (IOPS) of an active OCI Block Volume without detaching it from the running compute instance?"
        options = @(
            @{ id = "A"; text = "Change the Volume Performance Units (VPUs) per GB tier (e.g., between Balanced, Higher Performance, and Ultra High Performance)." },
            @{ id = "B"; text = "Reboot the physical hypervisor hosting the block volume." },
            @{ id = "C"; text = "Compress the volume into a ZIP archive and re-attach it via the CLI." },
            @{ id = "D"; text = "Migrate the block volume to a public subnet within the same VCN." }
        )
        correct_answer = @("A")
        explanation = "OCI Block Volume มีคุณสมบัติเด่นคือผู้ใช้งานสามารถปรับระดับประสิทธิภาพ (Performance Tier) ได้แบบไดนามิกผ่านการปรับค่า Volume Performance Units (VPUs/GB) เช่น Lower Cost (0 VPU), Balanced (10 VPUs), Higher Performance (20 VPUs) จนถึง Ultra High Performance (30-120 VPUs) ได้ทันทีโดยไม่ต้อง Detach วอลุ่ม หรือหยุดการทำงานของอินสแตนซ์
- ตัวเลือก B, C และ D ไม่ใช่วิธีการปรับประสิทธิภาพของ Block Volume"
        tags = @("core-services", "block-volume", "vpu", "performance")
        references = @(
            @{
                title = "Block Volume Performance"
                url = "https://docs.oracle.com/en-us/iaas/Content/Block/Concepts/blockvolumeperformance.htm"
            }
        )
    },
    @{
        id = "oci-fnd-001-q045"
        domain = "Core OCI Services"
        subtopics = @("File Storage")
        difficulty = "hard"
        type = "single"
        scenario = $true
        question = "An enterprise is migrating a legacy content management system requiring a shared POSIX-compliant file system that can be simultaneously mounted and accessed with concurrent read/write locks by dozens of compute instances across different Availability Domains. Which OCI service is designed specifically for this requirement?"
        options = @(
            @{ id = "A"; text = "OCI File Storage Service (FSS)" },
            @{ id = "B"; text = "OCI Object Storage Standard Tier" },
            @{ id = "C"; text = "OCI Boot Volume Service" },
            @{ id = "D"; text = "OCI Database Migration Service" }
        )
        correct_answer = @("A")
        explanation = "OCI File Storage Service (FSS) เป็นบริการระบบไฟล์แบบแชร์บนคลาวด์ที่รองรับโปรโตคอล Network File System version 3.0 (NFSv3) และมาตรฐาน POSIX ทำให้เซิร์ฟเวอร์หลายสิบหรือหลายร้อยเครื่องข้าม Availability Domains สามารถ Mount และอ่านเขียนข้อมูลไฟล์พร้อมกันได้อย่างราบรื่น
- ตัวเลือก B (Object Storage) ไม่รองรับมาตรฐาน POSIX และไม่สามารถ Mount เป็นไดรฟ์ระบบไฟล์มาตรฐานของ OS ได้โดยตรง
- ตัวเลือก C (Boot Volume) ผูกติดกับอินสแตนซ์เดียวเพื่อใช้บูต OS
- ตัวเลือก D เป็นเครื่องมือย้ายฐานข้อมูล"
        tags = @("core-services", "file-storage", "fss", "nfs", "scenarios")
        references = @(
            @{
                title = "Overview of File Storage"
                url = "https://docs.oracle.com/en-us/iaas/Content/File/Concepts/filestorageoverview.htm"
            }
        )
    },
    @{
        id = "oci-fnd-001-q046"
        domain = "Core OCI Services"
        subtopics = @("Object Storage: namespaces, buckets, objects, storage tiers และ lifecycle rules")
        difficulty = "medium"
        type = "single"
        scenario = $false
        question = "What is an OCI Pre-Authenticated Request (PAR), and when should it be utilized?"
        options = @(
            @{ id = "A"; text = "A unique URL that grants temporary read or write access to a specific bucket or object without requiring the user to have an OCI account or IAM credentials." },
            @{ id = "B"; text = "A permanent SSL certificate signed by Oracle for public web servers." },
            @{ id = "C"; text = "A dedicated hardware token required to log into the OCI Console." },
            @{ id = "D"; text = "A firewall rule that bypasses Network Security Groups for SSH connections." }
        )
        correct_answer = @("A")
        explanation = "Pre-Authenticated Request (PAR) คือลิงก์ URL พิเศษที่สร้างขึ้นมาเพื่อให้บุคคลภายนอกหรือระบบอื่นสามารถดาวน์โหลด (Read) หรืออัปโหลด (Write) ข้อมูลไปยัง Bucket หรือ Object ใน Object Storage ได้ชั่วคราวตามระยะเวลาที่กำหนด โดยผู้รับลิงก์ไม่จำเป็นต้องมีบัญชี OCI หรือรหัสผ่าน IAM แต่อย่างใด
- ตัวเลือก B, C, และ D ไม่ใช่คุณลักษณะของ Pre-Authenticated Request"
        tags = @("core-services", "object-storage", "par", "security")
        references = @(
            @{
                title = "Using Pre-Authenticated Requests"
                url = "https://docs.oracle.com/en-us/iaas/Content/Object/Tasks/usingpreauthenticatedrequests.htm"
            }
        )
    },
    @{
        id = "oci-fnd-001-q047"
        domain = "Core OCI Services"
        subtopics = @("Block Volume และ Boot Volume")
        difficulty = "medium"
        type = "multiple"
        scenario = $false
        question = "Which TWO disaster recovery and data protection capabilities are natively built into OCI Block Volume service? (Choose TWO)"
        options = @(
            @{ id = "A"; text = "Automated, policy-based volume backups scheduled on bronze, silver, or gold schedules" },
            @{ id = "B"; text = "Cross-region asynchronous block volume replication to protect against regional disasters" },
            @{ id = "C"; text = "Automatic optical disc burning and physical postal courier delivery" },
            @{ id = "D"; text = "Instant conversion of block volumes into public relational databases" },
            @{ id = "E"; text = "Unrestricted simultaneous read/write access from an unlimited number of public internet IP addresses without authentication" }
        )
        correct_answer = @("A", "B")
        explanation = "ความสามารถด้านการปกป้องข้อมูลของ OCI Block Volume:
- (A) นโยบายการสำรองข้อมูลอัตโนมัติตามนโยบาย (Policy-based backups) เช่น Bronze, Silver, Gold หรือ Custom Schedule
- (B) การทำ Cross-region Volume Replication แบบ Asynchronous ไปยังอีก Region หนึ่งเพื่อรองรับ Disaster Recovery ระดับภูมิภาค
- ตัวเลือก C, D, และ E ไม่ใช่ฟังก์ชันการทำงานของ Block Volume"
        tags = @("core-services", "block-volume", "backup", "disaster-recovery")
        references = @(
            @{
                title = "Overview of Block Volume Backups"
                url = "https://docs.oracle.com/en-us/iaas/Content/Block/Concepts/blockvolumebackups.htm"
            }
        )
    },
    @{
        id = "oci-fnd-001-q048"
        domain = "Core OCI Services"
        subtopics = @("Object Storage: namespaces, buckets, objects, storage tiers และ lifecycle rules")
        difficulty = "hard"
        type = "single"
        scenario = $true
        question = "When multiple development teams attempt to create Object Storage buckets with the name 'logs' in different compartments within the same tenancy, they discover that bucket names must be unique within their assigned tenancy scope. What is the top-level container string that defines this tenancy-wide scope across all OCI regions?"
        options = @(
            @{ id = "A"; text = "The Object Storage Namespace" },
            @{ id = "B"; text = "The Virtual Cloud Network CIDR" },
            @{ id = "C"; text = "The Fault Domain Identifier" },
            @{ id = "D"; text = "The Availability Domain Hash" }
        )
        correct_answer = @("A")
        explanation = "Object Storage Namespace คือสตริงระบุตัวตนระดับ Tenancy ที่ระบบกำหนดให้โดยอัตโนมัติ ซึ่งทำหน้าที่เป็นคอนเทนเนอร์ระดับบนสุดสำหรับ Buckets ทั้งหมดใน Tenancy นั้น โดยชื่อ Bucket จะต้องไม่ซ้ำกันภายใน Namespace เดียวกัน ครอบคลุมทุก Region ของ Tenancy นั้น
- ตัวเลือก B, C และ D ไม่ได้ทำหน้าที่เป็น Scope จัดการชื่อ Bucket ใน Object Storage"
        tags = @("core-services", "object-storage", "namespace", "architecture")
        references = @(
            @{
                title = "Understanding Object Storage Namespaces"
                url = "https://docs.oracle.com/en-us/iaas/Content/Object/Tasks/managingnamespaces.htm"
            }
        )
    },
    @{
        id = "oci-fnd-001-q049"
        domain = "Core OCI Services"
        subtopics = @("Object Storage: namespaces, buckets, objects, storage tiers และ lifecycle rules")
        difficulty = "medium"
        type = "multiple"
        scenario = $true
        question = "A security administrator must protect critical corporate financial spreadsheets stored in OCI Object Storage from being accidentally overwritten, deleted, or maliciously modified by ransomware. Which TWO OCI Object Storage features directly provide this protection? (Choose TWO)"
        options = @(
            @{ id = "A"; text = "Object Versioning" },
            @{ id = "B"; text = "Retention Rules (WORM - Write Once, Read Many)" },
            @{ id = "C"; text = "Internet Gateway Egress Whitelisting" },
            @{ id = "D"; text = "Preemptible Bucket Bursting" },
            @{ id = "E"; text = "Bare Metal Direct Memory Attachment" }
        )
        correct_answer = @("A", "B")
        explanation = "คุณสมบัติในการป้องกันข้อมูลสูญหายหรือถูกดัดแปลงใน Object Storage:
- (A) Object Versioning: เมื่อมีการอัปโหลดไฟล์ทับหรือสั่งลบ ระบบจะเก็บประวัติเวอร์ชันก่อนหน้าเอาไว้ ทำให้สามารถกู้คืนกลับมาได้เสมอ
- (B) Retention Rules (WORM): กฎบังคับห้ามแก้ไขหรือลบข้อมูลตามระยะเวลาที่กำหนด เพื่อปฏิบัติตามมาตรฐานความปลอดภัยและป้องกันมัลแวร์เรียกค่าไถ่
- ตัวเลือก C, D, และ E ไม่ใช่ฟังก์ชันป้องกันข้อมูลของ Object Storage"
        tags = @("core-services", "object-storage", "versioning", "retention-rules", "security")
        references = @(
            @{
                title = "Using Retention Rules"
                url = "https://docs.oracle.com/en-us/iaas/Content/Object/Tasks/usingretentionrules.htm"
            }
        )
    }
)
