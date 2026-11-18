# Domain 3 Part 2: Networking, Databases & Observability (26 questions: Q050 - Q075)
# 21 single, 5 multiple (Q060, Q061, Q063, Q069, Q074)
# Difficulty: 6 easy, 13 medium, 7 hard
# Scenarios: 15 true, 11 false

$domain3_p2 = @(
    @{
        id = "oci-fnd-001-q050"
        domain = "Core OCI Services"
        subtopics = @("VCN, subnets, route tables และ gateways")
        difficulty = "easy"
        type = "single"
        scenario = $false
        question = "What is an OCI Virtual Cloud Network (VCN), and what is its operational scope?"
        options = @(
            @{ id = "A"; text = "A software-defined private network configured within a specific OCI region with custom IPv4 CIDR blocks." },
            @{ id = "B"; text = "A physical network switch installed in the customer's on-premises office." },
            @{ id = "C"; text = "A global network that spans across all cloud providers simultaneously." },
            @{ id = "D"; text = "A single virtual network interface card attached to a storage volume." }
        )
        correct_answer = @("A")
        explanation = "Virtual Cloud Network (VCN) คือเครือข่ายเสมือนส่วนตัว (Software-defined network) ที่สร้างขึ้นภายใน OCI Region ที่กำหนด โดยผู้ใช้สามารถกำหนดช่วง IPv4/IPv6 CIDR Block, สร้าง Subnets, Route Tables และกำหนดค่าไฟร์วอลล์เพื่อควบคุมทราฟฟิกได้
- ตัวเลือก B, C และ D ไม่ถูกต้องตามนิยามและขอบเขตระดับ Region ของ VCN"
        tags = @("core-services", "networking", "vcn", "architecture")
        references = @(
            @{
                title = "Overview of Networking"
                url = "https://docs.oracle.com/en-us/iaas/Content/Network/Concepts/overview.htm"
            }
        )
    },
    @{
        id = "oci-fnd-001-q051"
        domain = "Core OCI Services"
        subtopics = @("VCN, subnets, route tables และ gateways")
        difficulty = "easy"
        type = "single"
        scenario = $false
        question = "What is the primary technical distinction between a Public Subnet and a Private Subnet in an OCI VCN?"
        options = @(
            @{ id = "A"; text = "Instances launched in a Public Subnet can be assigned public IP addresses, whereas instances in a Private Subnet are prohibited from having public IP addresses." },
            @{ id = "B"; text = "Public Subnets are free of charge, while Private Subnets require a paid corporate license." },
            @{ id = "C"; text = "Private Subnets can only host Windows operating systems, whereas Public Subnets only host Linux." },
            @{ id = "D"; text = "Public Subnets span multiple regions, while Private Subnets are restricted to a single server chassis." }
        )
        correct_answer = @("A")
        explanation = "ความแตกต่างทางเทคนิคระหว่าง Public Subnet และ Private Subnet ใน OCI:
- Public Subnet อนุญาตให้ Virtual Network Interface Cards (VNICs) ของ Compute Instance สามารถผูกกับ Public IP Address ได้ เพื่อสื่อสารกับอินเทอร์เน็ตโดยตรง
- Private Subnet ไม่อนุญาตให้มี Public IP Address อย่างเด็ดขาด เพื่อป้องกันไม่ให้อินสแตนซ์ถูกเข้าถึงได้โดยตรงจากภายนอก
- ตัวเลือก B, C, และ D ไม่เป็นความจริง"
        tags = @("core-services", "networking", "subnets", "public-private")
        references = @(
            @{
                title = "VCNs and Subnets"
                url = "https://docs.oracle.com/en-us/iaas/Content/Network/Tasks/managingVCNs.htm"
            }
        )
    },
    @{
        id = "oci-fnd-001-q052"
        domain = "Core OCI Services"
        subtopics = @("Internet Gateway, NAT Gateway, Service Gateway และ DRG")
        difficulty = "medium"
        type = "single"
        scenario = $true
        question = "A backend database server is deployed inside a private subnet to prevent inbound connections from the internet. However, the database server must periodically initiate outbound connections to download operating system security patches and updates. Which OCI gateway should the network architect attach to the VCN?"
        options = @(
            @{ id = "A"; text = "NAT Gateway" },
            @{ id = "B"; text = "Internet Gateway" },
            @{ id = "C"; text = "Local Peering Gateway" },
            @{ id = "D"; text = "FastConnect Virtual Circuit" }
        )
        correct_answer = @("A")
        explanation = "NAT Gateway (Network Address Translation Gateway) ช่วยให้อินสแตนซ์ที่อยู่ใน Private Subnet สามารถส่งทราฟฟิกออกไปสู่อินเทอร์เน็ตได้เพียงทิศทางเดียว (Outbound-only) เช่น เพื่อดาวน์โหลดแพตช์อัปเดต โดยจะบล็อกการเชื่อมต่อที่ริเริ่มจากภายนอกเข้ามายังอินสแตนซ์โดยตรง (No inbound internet traffic)
- ตัวเลือก B (Internet Gateway) เป็นการเปิดให้รับทราฟฟิกเข้า-ออกสองทาง (Bidirectional) ซึ่งใช้สำหรับ Public Subnet
- ตัวเลือก C (Local Peering Gateway) ใช้เชื่อมระหว่าง VCN สองวง
- ตัวเลือก D (FastConnect) คือสายสัญญาณส่วนตัวเชื่อม On-premises"
        tags = @("core-services", "networking", "nat-gateway", "scenarios")
        references = @(
            @{
                title = "NAT Gateway"
                url = "https://docs.oracle.com/en-us/iaas/Content/Network/Tasks/NATgateway.htm"
            }
        )
    },
    @{
        id = "oci-fnd-001-q053"
        domain = "Core OCI Services"
        subtopics = @("Internet Gateway, NAT Gateway, Service Gateway และ DRG")
        difficulty = "medium"
        type = "single"
        scenario = $true
        question = "A data engineering team hosts batch processing VMs inside a private subnet. The VMs need to upload large data files into OCI Object Storage without allowing network traffic to traverse the public internet or incurring NAT gateway data transfer overhead. Which OCI gateway should be configured?"
        options = @(
            @{ id = "A"; text = "Service Gateway" },
            @{ id = "B"; text = "Internet Gateway" },
            @{ id = "C"; text = "Dynamic Routing Gateway" },
            @{ id = "D"; text = "Storage Gateway Appliance" }
        )
        correct_answer = @("A")
        explanation = "Service Gateway ช่วยให้อินสแตนซ์ใน VCN (รวมถึงใน Private Subnet) สามารถเชื่อมต่อกับบริการสาธารณะของ Oracle ภายใน Region เดียวกัน (เช่น OCI Object Storage, Autonomous Database) ได้โดยตรงผ่านเครือข่าย Private Backbone ของ Oracle โดยไม่ต้องส่งทราฟฟิกออกสู่อินเทอร์เน็ตสาธารณะ และไม่จำเป็นต้องมี Public IP หรือ NAT Gateway
- ตัวเลือก B ส่งทราฟฟิกออกเน็ตสาธารณะ
- ตัวเลือก C ใช้สำหรับเชื่อมต่อกับ On-premises หรือ VCN อื่น
- ตัวเลือก D เป็นซอฟต์แวร์ที่ติดตั้งใน On-premises เพื่อซิงค์ไฟล์ขึ้น Object Storage"
        tags = @("core-services", "networking", "service-gateway", "object-storage")
        references = @(
            @{
                title = "Service Gateway"
                url = "https://docs.oracle.com/en-us/iaas/Content/Network/Tasks/servicegateway.htm"
            }
        )
    },
    @{
        id = "oci-fnd-001-q054"
        domain = "Core OCI Services"
        subtopics = @("Internet Gateway, NAT Gateway, Service Gateway และ DRG")
        difficulty = "hard"
        type = "single"
        scenario = $true
        question = "An enterprise network architect is designing a centralized hub-and-spoke transit network connecting multiple OCI VCNs, an on-premises data center via FastConnect, and a branch office via Site-to-Site VPN. Which OCI virtual routing component acts as the central router to interconnect all these network attachments?"
        options = @(
            @{ id = "A"; text = "Dynamic Routing Gateway (DRG)" },
            @{ id = "B"; text = "Internet Gateway" },
            @{ id = "C"; text = "Local Peering Gateway (LPG)" },
            @{ id = "D"; text = "Service Gateway" }
        )
        correct_answer = @("A")
        explanation = "Dynamic Routing Gateway (DRG) คือเราเตอร์เสมือนระดับภูมิภาค (Regional virtual router) ที่ทำหน้าที่เป็นศูนย์กลางเชื่อมโยงเครือข่าย รองรับการเชื่อมต่อกับ On-premises ผ่าน Site-to-Site VPN, FastConnect รวมถึงการเชื่อมต่อแบบ Hub-and-Spoke ข้าม VCN หลายวงใน Region เดียวกันหรือข้าม Region (Remote VCN Peering)
- ตัวเลือก B (Internet Gateway) ใช้สำหรับออกอินเทอร์เน็ตเท่านั้น
- ตัวเลือก C (LPG) ใช้เชื่อมต่อ 1 ต่อ 1 ระหว่างสอง VCN ใน Region เดียวกันแบบ Non-transitive
- ตัวเลือก D (Service Gateway) ใช้เชื่อมต่อไปยังบริการของ Oracle เท่านั้น"
        tags = @("core-services", "networking", "drg", "hybrid-networking")
        references = @(
            @{
                title = "Dynamic Routing Gateway (DRG)"
                url = "https://docs.oracle.com/en-us/iaas/Content/Network/Tasks/managingDRGs.htm"
            }
        )
    },
    @{
        id = "oci-fnd-001-q055"
        domain = "Core OCI Services"
        subtopics = @("Security Lists และ Network Security Groups")
        difficulty = "medium"
        type = "single"
        scenario = $true
        question = "A security administrator needs to implement micro-segmentation within an existing application subnet. Different virtual machines within the same subnet require distinct firewall ingress and egress rules without creating multiple separate subnets. Which OCI network security feature allows rules to be applied directly to individual VNICs rather than the entire subnet?"
        options = @(
            @{ id = "A"; text = "Network Security Groups (NSGs)" },
            @{ id = "B"; text = "Security Lists" },
            @{ id = "C"; text = "VCN Route Tables" },
            @{ id = "D"; text = "Internet Gateways" }
        )
        correct_answer = @("A")
        explanation = "Network Security Groups (NSGs) ช่วยให้ผู้ดูแลระบบสามารถกำหนดกฎไฟร์วอลล์ (Ingress/Egress rules) ได้โดยตรงที่ระดับ Virtual Network Interface Card (VNIC) ของแต่ละอินสแตนซ์ ทำให้สามารถแยกความปลอดภัยแบบ Micro-segmentation ให้อินสแตนซ์ที่อยู่ใน Subnet เดียวกันมีกฎที่แตกต่างกันได้
- ตัวเลือก B (Security Lists) ทำงานที่ระดับ Subnet โดยกฎจะถูกบังคับใช้กับทุก VNIC ใน Subnet นั้นเหมือนกันทั้งหมด
- ตัวเลือก C (Route Tables) ใช้กำหนดเส้นทางของแพ็กเก็ต ไม่ใช่ไฟร์วอลล์
- ตัวเลือก D เป็นเกตเวย์ออกสู่อินเทอร์เน็ต"
        tags = @("core-services", "networking", "nsg", "security-lists", "micro-segmentation")
        references = @(
            @{
                title = "Network Security Groups"
                url = "https://docs.oracle.com/en-us/iaas/Content/Network/Concepts/networksecuritygroups.htm"
            }
        )
    },
    @{
        id = "oci-fnd-001-q056"
        domain = "Core OCI Services"
        subtopics = @("VCN, subnets, route tables และ gateways")
        difficulty = "medium"
        type = "single"
        scenario = $false
        question = "How does an OCI VCN Route Table evaluate where to direct outbound network packets originating from an attached subnet?"
        options = @(
            @{ id = "A"; text = "By matching the packet's destination IP against route rules containing destination CIDR blocks and forwarding it to the target gateway of the most specific matching rule." },
            @{ id = "B"; text = "By inspecting HTTP cookies and forwarding the packet to the nearest Availability Domain." },
            @{ id = "C"; text = "By hashing the MAC address of the source virtual machine." },
            @{ id = "D"; text = "By querying DNS TXT records stored in the Tenancy root compartment." }
        )
        correct_answer = @("A")
        explanation = "VCN Route Table ประกอบด้วยชุดของกฎการกำหนดเส้นทาง (Route Rules) ซึ่งทำงานโดยการเปรียบเทียบ Destination IP Address ของแพ็กเก็ตกับ Destination CIDR Block ที่กำหนดไว้ หากตรงกับกฎใด (โดยยึดกฎที่มีความเฉพาะเจาะจงมากที่สุด หรือ Longest Prefix Match) ก็จะส่งแพ็กเก็ตไปยัง Next-hop Target Gateway นั้น (เช่น Internet Gateway, NAT Gateway หรือ DRG)
- ตัวเลือก B, C และ D ไม่ใช่วิธีการทำงานของการเราต์แพ็กเก็ตในเลเยอร์เครือข่ายของ OCI"
        tags = @("core-services", "networking", "route-tables")
        references = @(
            @{
                title = "Route Tables"
                url = "https://docs.oracle.com/en-us/iaas/Content/Network/Tasks/managingroutetables.htm"
            }
        )
    },
    @{
        id = "oci-fnd-001-q057"
        domain = "Core OCI Services"
        subtopics = @("Site-to-Site VPN และ FastConnect ในระดับแนวคิด")
        difficulty = "hard"
        type = "single"
        scenario = $true
        question = "An enterprise needs to connect its primary corporate data center to OCI to support continuous, multi-terabyte real-time database replication. The network team requires a dedicated, private connection with predictable latency, high bandwidth (1 Gbps to 100 Gbps), and an enterprise SLA that completely bypasses the public internet. Which connectivity solution should they choose?"
        options = @(
            @{ id = "A"; text = "OCI FastConnect" },
            @{ id = "B"; text = "OCI Site-to-Site VPN (IPsec)" },
            @{ id = "C"; text = "Public Internet Gateway with SSL tunneling" },
            @{ id = "D"; text = "Storage Gateway file sync" }
        )
        correct_answer = @("A")
        explanation = "OCI FastConnect ให้บริการช่องทางเชื่อมต่อเครือข่ายส่วนตัวโดยเฉพาะ (Dedicated private connection) ระหว่างดาต้าเซ็นเตอร์ของลูกค้ากับ OCI โดยวิ่งผ่านโครงข่ายส่วนตัวของพาร์ทเนอร์ ไม่ผ่านอินเทอร์เน็ตสาธารณะ จึงให้ความเร็วสูง (ตั้งแต่ 1 Gbps ถึง 100 Gbps), แบนด์วิดท์สม่ำเสมอ, ค่า Latency คงที่แน่นอน และมี SLA รองรับ
- ตัวเลือก B (Site-to-Site VPN) วิ่งผ่านอินเทอร์เน็ตสาธารณะแบบเข้ารหัส IPsec ทำให้ความเร็วและความหน่วงขึ้นอยู่กับความหนาแน่นของอินเทอร์เน็ต จึงไม่ตอบโจทย์ความเสถียรระดับสูง
- ตัวเลือก C และ D ไม่ใช่วิธีการเชื่อมต่อเครือข่ายระดับองค์กรที่มี SLA"
        tags = @("core-services", "networking", "fastconnect", "vpn", "hybrid-cloud")
        references = @(
            @{
                title = "FastConnect Overview"
                url = "https://docs.oracle.com/en-us/iaas/Content/Network/Concepts/fastconnect.htm"
            }
        )
    },
    @{
        id = "oci-fnd-001-q058"
        domain = "Core OCI Services"
        subtopics = @("Load Balancing และ DNS ในระดับพื้นฐาน")
        difficulty = "medium"
        type = "single"
        scenario = $true
        question = "An online media service requires an OCI load balancer to distribute incoming HTTPS traffic across backend web servers, perform SSL termination, and support advanced Layer 7 routing rules based on request URL paths. Furthermore, the network administrator wants to set custom minimum and maximum bandwidth limits. Which service should they deploy?"
        options = @(
            @{ id = "A"; text = "OCI Flexible Load Balancer" },
            @{ id = "B"; text = "OCI Network Load Balancer (NLB)" },
            @{ id = "C"; text = "OCI Local Peering Gateway" },
            @{ id = "D"; text = "OCI Dynamic Routing Gateway" }
        )
        correct_answer = @("A")
        explanation = "OCI Flexible Load Balancer ทำงานที่ Layer 7 (HTTP/HTTPS) และ Layer 4 (TCP) รองรับฟังก์ชันระดับสูง เช่น SSL/TLS Termination, Path-based Routing, Cookie-based Session Persistence และมีจุดเด่นคือสถาปัตยกรรม Flexible Shape ที่สามารถกำหนดแบนด์วิดท์ต่ำสุดและสูงสุด (Min/Max Bandwidth) ได้ตามต้องการ
- ตัวเลือก B (Network Load Balancer) ทำงานที่ Layer 4 เน้น Latency ต่ำพิเศษแบบ Pass-through ไม่รองรับ SSL Termination หรือ Layer 7 Path Routing
- ตัวเลือก C และ D เป็นเราเตอร์เสมือน ไม่ใช่ Load Balancer"
        tags = @("core-services", "networking", "load-balancer", "layer-7")
        references = @(
            @{
                title = "Overview of Load Balancing"
                url = "https://docs.oracle.com/en-us/iaas/Content/Balance/Concepts/balanceoverview.htm"
            }
        )
    },
    @{
        id = "oci-fnd-001-q059"
        domain = "Core OCI Services"
        subtopics = @("Load Balancing และ DNS ในระดับพื้นฐาน")
        difficulty = "easy"
        type = "single"
        scenario = $false
        question = "Which load balancing option in OCI is optimized for ultra-low latency, handles millions of requests per second, operates at Layer 4 (TCP/UDP/ICMP), and preserves client source IP addresses transparently?"
        options = @(
            @{ id = "A"; text = "OCI Network Load Balancer (NLB)" },
            @{ id = "B"; text = "OCI Flexible Application Load Balancer" },
            @{ id = "C"; text = "OCI Web Application Firewall (WAF)" },
            @{ id = "D"; text = "OCI Traffic Management Steering" }
        )
        correct_answer = @("A")
        explanation = "OCI Network Load Balancer (NLB) เป็นโหลดบาลานเซอร์ประสิทธิภาพสูงระดับ Layer 4 (TCP, UDP, ICMP) ที่ให้ค่า Latency ต่ำที่สุดระดับไมโครวินาที (Ultra-low latency) มีลักษณะเป็น Pass-through ที่ส่งต่อข้อมูลไปยังเซิร์ฟเวอร์ปลายทางโดยยังคงรักษา Client Source IP ดั้งเดิมไว้โดยไม่ต้องแปลงข้อมูล
- ตัวเลือก B (Flexible Load Balancer) ทำงานในระดับ Layer 7 มีการตรวจสอบและแปลงทราฟฟิก (Proxy)
- ตัวเลือก C (WAF) คือไฟร์วอลล์ตรวจจับการโจมตีเว็บ
- ตัวเลือก D เป็นระบบจัดการเส้นทางผ่าน DNS"
        tags = @("core-services", "networking", "network-load-balancer", "layer-4")
        references = @(
            @{
                title = "Network Load Balancer Overview"
                url = "https://docs.oracle.com/en-us/iaas/Content/NetworkLoadBalancer/overview.htm"
            }
        )
    },
    @{
        id = "oci-fnd-001-q060"
        domain = "Core OCI Services"
        subtopics = @("VCN, subnets, route tables และ gateways")
        difficulty = "hard"
        type = "multiple"
        scenario = $true
        question = "An organization wants to configure Local VCN Peering between two distinct VCNs ('VCN_Sales' and 'VCN_HR') located within the same OCI region. Which TWO architectural requirements must be met to establish this peering connection successfully? (Choose TWO)"
        options = @(
            @{ id = "A"; text = "The two VCNs must not have overlapping CIDR IP address blocks." },
            @{ id = "B"; text = "Each VCN must have an attached Local Peering Gateway (LPG) with an established peering relationship." },
            @{ id = "C"; text = "Both VCNs must reside in the exact same compartment and have identical root passwords." },
            @{ id = "D"; text = "Transitive routing is automatically enabled so VCN_Sales can route traffic through VCN_HR to a third external network without extra configuration." },
            @{ id = "E"; text = "All compute instances in both VCNs must be terminated before creating the peering connection." }
        )
        correct_answer = @("A", "B")
        explanation = "ข้อกำหนดในการทำ Local VCN Peering ใน Region เดียวกัน:
- (A) VCN ทั้งสองวงจะต้องไม่มีช่วง CIDR Block ที่ทับซ้อนกัน (Non-overlapping CIDRs)
- (B) แต่ละ VCN จะต้องมี Local Peering Gateway (LPG) สร้างขึ้นมาและทำการจับคู่ (Peer) ระหว่างกัน
- ตัวเลือก C ผิด เพราะ VCN ที่ทำการ Peer กันสามารถอยู่คนละ Compartment ได้
- ตัวเลือก D ผิด เพราะการ Peer กันในระดับ LPG เป็นแบบ Non-transitive routing (ไม่ส่งต่อทราฟฟิกไปยังเน็ตเวิร์กที่ 3 แบบอัตโนมัติ)
- ตัวเลือก E ผิด ไม่จำเป็นต้องปิดเครื่องขณะทำ Peering"
        tags = @("core-services", "networking", "vcn-peering", "lpg")
        references = @(
            @{
                title = "Local VCN Peering (through LPGs)"
                url = "https://docs.oracle.com/en-us/iaas/Content/Network/Tasks/localVCNpeering.htm"
            }
        )
    },
    @{
        id = "oci-fnd-001-q061"
        domain = "Core OCI Services"
        subtopics = @("Load Balancing และ DNS ในระดับพื้นฐาน")
        difficulty = "medium"
        type = "multiple"
        scenario = $false
        question = "Which TWO logical components are mandatory building blocks when configuring an OCI Flexible Load Balancer to accept client connections and route them to compute instances? (Choose TWO)"
        options = @(
            @{ id = "A"; text = "A Listener that monitors for incoming connection requests on a specified protocol and port" },
            @{ id = "B"; text = "A Backend Set that groups destination backend servers together with a defined health check policy and load balancing algorithm" },
            @{ id = "C"; text = "A Dynamic Routing Gateway attached to every target compute instance" },
            @{ id = "D"; text = "A Pre-Authenticated Request generated for each compute VNIC" },
            @{ id = "E"; text = "A Dedicated Exadata Infrastructure rack deployed in the same subnet" }
        )
        correct_answer = @("A", "B")
        explanation = "องค์ประกอบสำคัญของ OCI Load Balancer ได้แก่:
- (A) Listener: ตัวคอยดักรับการเชื่อมต่อจากภายนอก โดยระบุ Protocol และ Port (เช่น HTTP บน Port 80 หรือ HTTPS บน Port 443)
- (B) Backend Set: กลุ่มของเซิร์ฟเวอร์ปลายทาง (Backend Servers) ที่ทำหน้าที่ประมวลผลคำขอ โดยผูกกับนโยบายตรวจสอบสุขภาพ (Health Check Policy) และอัลกอริทึมในการกระจายโหลด (เช่น Round Robin, IP Hash, Least Connections)
- ตัวเลือก C, D, และ E ไม่ใช่องค์ประกอบของ Load Balancer"
        tags = @("core-services", "networking", "load-balancer", "components")
        references = @(
            @{
                title = "Overview of Load Balancing"
                url = "https://docs.oracle.com/en-us/iaas/Content/Balance/Concepts/balanceoverview.htm"
            }
        )
    },
    @{
        id = "oci-fnd-001-q062"
        domain = "Core OCI Services"
        subtopics = @("VCN, subnets, route tables และ gateways")
        difficulty = "hard"
        type = "single"
        scenario = $true
        question = "An administrator provisions a public-facing virtual machine. By default, an Ephemeral Public IP address is assigned to its primary VNIC. What happens to this Ephemeral Public IP if the administrator stops (powers off) the compute instance?"
        options = @(
            @{ id = "A"; text = "The Ephemeral Public IP is automatically released back to the Oracle public IP pool and might not be reacquired when restarted; a Reserved Public IP should be used to retain a permanent address." },
            @{ id = "B"; text = "The Ephemeral Public IP remains permanently reserved and will never change for the entire lifetime of the tenancy." },
            @{ id = "C"; text = "The Ephemeral Public IP is immediately converted into a private DNS record." },
            @{ id = "D"; text = "The compute instance's boot volume is automatically deleted." }
        )
        correct_answer = @("A")
        explanation = "Ephemeral Public IP คือไอพีสาธารณะแบบชั่วคราว เมื่ออินสแตนซ์ถูก Stop หรือ Terminate หมายเลขไอพีนี้จะถูกปล่อยคืนกลับสู่ Pool กลางของ OCI ทันที หากเปิดเครื่องใหม่จะได้หมายเลขไอพีใหม่ หากต้องการให้หมายเลขไอพีคงเดิมเสมอแม้จะปิดเครื่อง จะต้องใช้งาน 'Reserved Public IP'
- ตัวเลือก B อธิบายลักษณะของ Reserved Public IP ไม่ใช่ Ephemeral
- ตัวเลือก C และ D ไม่ถูกต้องตามการทำงานของ Public IP"
        tags = @("core-services", "networking", "public-ip", "ephemeral-vs-reserved")
        references = @(
            @{
                title = "Public IP Addresses"
                url = "https://docs.oracle.com/en-us/iaas/Content/Network/Tasks/managingpublicIPs.htm"
            }
        )
    },
    @{
        id = "oci-fnd-001-q063"
        domain = "Core OCI Services"
        subtopics = @("VCN, subnets, route tables และ gateways")
        difficulty = "medium"
        type = "multiple"
        scenario = $true
        question = "An organization enforces a strict security policy requiring that backend compute instances in private subnets must never be directly exposed to the public internet. Which TWO methods are officially recommended by OCI to establish secure administrative SSH connections to these private instances? (Choose TWO)"
        options = @(
            @{ id = "A"; text = "Using the OCI Bastion service to open temporary, secure SSH port-forwarding sessions" },
            @{ id = "B"; text = "Connecting via a corporate on-premises network linked to the VCN through Site-to-Site VPN or FastConnect" },
            @{ id = "C"; text = "Assigning an ephemeral public IP address to the private database instance's VNIC" },
            @{ id = "D"; text = "Creating an open 0.0.0.0/0 ingress rule on port 22 in an attached Internet Gateway" },
            @{ id = "E"; text = "Publishing the server's private SSH key in a public Object Storage bucket" }
        )
        correct_answer = @("A", "B")
        explanation = "วิธีการที่ปลอดภัยและเป็น Best Practice ในการเข้าถึงเครื่อง Private Instance ผ่าน SSH:
- (A) OCI Bastion: เซอร์วิสที่มีการควบคุมความปลอดภัยสูง ให้สร้าง Session ชั่วคราว (Time-limited) เพื่อทำ SSH Port-forwarding หรือ Managed SSH เข้าไปยัง Private IP โดยไม่ต้องเปิด Public IP ให้เครื่องเป้าหมาย
- (B) การเชื่อมต่อผ่านเครือข่ายภายในองค์กรโดยตรง ผ่านช่องทาง Site-to-Site VPN หรือ FastConnect
- ตัวเลือก C และ D ละเมิดนโยบายความปลอดภัยและทำให้เครื่องเสี่ยงต่อการถูกโจมตีจากอินเทอร์เน็ต
- ตัวเลือก E เป็นข้อผิดพลาดร้ายแรงด้านความปลอดภัย"
        tags = @("core-services", "networking", "bastion", "ssh", "security")
        references = @(
            @{
                title = "OCI Bastion Overview"
                url = "https://docs.oracle.com/en-us/iaas/Content/Bastion/Concepts/bastionoverview.htm"
            }
        )
    },
    @{
        id = "oci-fnd-001-q064"
        domain = "Core OCI Services"
        subtopics = @("Autonomous Database, Base Database และ MySQL HeatWave ในระดับพื้นฐาน")
        difficulty = "easy"
        type = "single"
        scenario = $false
        question = "Which workload type of Oracle Autonomous Database is pre-configured and optimized specifically for high-concurrency, low-latency online transaction processing, batch operations, and reporting?"
        options = @(
            @{ id = "A"; text = "Autonomous Transaction Processing (ATP)" },
            @{ id = "B"; text = "Autonomous Data Warehouse (ADW)" },
            @{ id = "C"; text = "Autonomous JSON Database (AJD)" },
            @{ id = "D"; text = "Autonomous NoSQL Key-Value Store" }
        )
        correct_answer = @("A")
        explanation = "Autonomous Transaction Processing (ATP) ได้รับการปรับแต่ง (Tuned & Optimized) มาโดยเฉพาะสำหรับงานประเภท Online Transaction Processing (OLTP) ซึ่งต้องการความเร็วในการตอบสนองคำสั่งต่อวินาทีสูง (Low-latency), รองรับการทำธุรกรรมแบบพร้อมกันจำนวนมาก (High concurrency) และงานประมวลผลทั่วไป
- ตัวเลือก B (ADW) ปรับแต่งมาสำหรับงาน Data Warehouse และ Complex Analytical Queries
- ตัวเลือก C (AJD) ปรับแต่งสำหรับงานเก็บข้อมูล JSON เอกสารแบบ NoSQL-style
- ตัวเลือก D ไม่ใช่ชื่อทางการของ Autonomous Database workload"
        tags = @("core-services", "database", "autonomous-database", "atp")
        references = @(
            @{
                title = "Overview of Autonomous Database"
                url = "https://docs.oracle.com/en-us/iaas/Content/Database/Concepts/adboverview.htm"
            }
        )
    },
    @{
        id = "oci-fnd-001-q065"
        domain = "Core OCI Services"
        subtopics = @("Autonomous Database, Base Database และ MySQL HeatWave ในระดับพื้นฐาน")
        difficulty = "medium"
        type = "single"
        scenario = $true
        question = "An enterprise IT department needs to eliminate routine database administration overhead. They require a database that automatically applies security patches without downtime, tunes SQL queries, creates and tests indexes automatically using machine learning, and scales compute resources online. Which OCI service provides these 'self-driving' capabilities?"
        options = @(
            @{ id = "A"; text = "Oracle Autonomous Database" },
            @{ id = "B"; text = "OCI Base Database Service (VM DB System)" },
            @{ id = "C"; text = "Oracle Cloud Infrastructure Container Engine" },
            @{ id = "D"; text = "OCI Block Volume Backup Engine" }
        )
        correct_answer = @("A")
        explanation = "Oracle Autonomous Database เป็นฐานข้อมูลคลาวด์อัจฉริยะที่มีคุณสมบัติ 'Self-driving, Self-securing, Self-repairing' โดยใช้เทคโนโลยี Machine Learning ในการดูแลตนเองทั้งหมด เช่น การลงแพตช์ความปลอดภัยโดยระบบไม่หยุดทำงาน (Zero downtime patching), การสร้างและทดสอบ Index อัตโนมัติ (Automatic indexing), การจูน SQL และการขยายขนาด CPU/Storage แบบออนไลน์
- ตัวเลือก B (Base Database) ผู้ดูแลระบบยังต้องกดสั่งแพตช์และบริหารจัดการฐานข้อมูลเอง
- ตัวเลือก C และ D ไม่ใช่บริการฐานข้อมูลอัตโนมัติ"
        tags = @("core-services", "database", "autonomous-database", "self-driving")
        references = @(
            @{
                title = "Overview of Autonomous Database"
                url = "https://docs.oracle.com/en-us/iaas/Content/Database/Concepts/adboverview.htm"
            }
        )
    },
    @{
        id = "oci-fnd-001-q066"
        domain = "Core OCI Services"
        subtopics = @("Autonomous Database, Base Database และ MySQL HeatWave ในระดับพื้นฐาน")
        difficulty = "medium"
        type = "single"
        scenario = $true
        question = "A database administrator (DBA) is migrating an existing on-premises enterprise application to OCI. The application requires direct root SSH access to the underlying Linux operating system hosting the database, as well as custom database parameters and third-party monitoring agents installed on the OS. Which OCI database service supports this level of operating system access?"
        options = @(
            @{ id = "A"; text = "OCI Base Database Service (VM DB System)" },
            @{ id = "B"; text = "Oracle Autonomous Database on Shared Infrastructure" },
            @{ id = "C"; text = "Oracle Autonomous JSON Database" },
            @{ id = "D"; text = "OCI Container Registry Service" }
        )
        correct_answer = @("A")
        explanation = "OCI Base Database Service (VM DB System) ให้สิทธิ์ Root/SSH Access แก่ลูกค้าในการเข้าถึงระบบปฏิบัติการของเครื่องโฮสต์ที่รันฐานข้อมูล ทำให้ DBA สามารถปรับแต่งพารามิเตอร์ของระบบ ติดตั้ง Third-party Agent และควบคุมซอฟต์แวร์ Oracle Database ได้เหมือนกับเซิร์ฟเวอร์ On-premises
- ตัวเลือก B และ C (Autonomous Database) เป็น Fully Managed PaaS ที่ล็อกการเข้าถึง OS โดยสิ้นเชิงเพื่อความปลอดภัยและความเป็นอัตโนมัติ จึงไม่มี Root/OS Access ให้ผู้ใช้
- ตัวเลือก D เป็นที่เก็บ Docker Image ไม่ใช่ฐานข้อมูล"
        tags = @("core-services", "database", "base-database", "vm-db-system")
        references = @(
            @{
                title = "Overview of the Base Database Service"
                url = "https://docs.oracle.com/en-us/iaas/Content/Database/Concepts/overview.htm"
            }
        )
    },
    @{
        id = "oci-fnd-001-q067"
        domain = "Core OCI Services"
        subtopics = @("Autonomous Database, Base Database และ MySQL HeatWave ในระดับพื้นฐาน")
        difficulty = "hard"
        type = "single"
        scenario = $true
        question = "An enterprise is planning to deploy Oracle Autonomous Database. They must choose between Serverless (Shared) and Dedicated deployment models. What is the defining characteristic of the Autonomous Database Dedicated deployment model?"
        options = @(
            @{ id = "A"; text = "The customer provisions a private, dedicated Exadata Cloud Infrastructure hardware environment inside OCI exclusively for their tenancy, retaining full control over database container lifecycles and software maintenance schedules." },
            @{ id = "B"; text = "The customer installs Autonomous Database on physical servers inside their personal home office." },
            @{ id = "C"; text = "Oracle manually assigns a DBA team to execute weekly SQL scripts via telephone confirmation." },
            @{ id = "D"; text = "The database runs strictly inside an open-source Docker container on a shared public subnet." }
        )
        correct_answer = @("A")
        explanation = "Autonomous Database Dedicated ให้บริการบน Exadata Cloud Infrastructure ฮาร์ดแวร์จริงที่จัดสรรให้ลูกค้ารายนั้นแต่เพียงผู้เดียว (Single-tenant dedicated hardware) ภายใน OCI ทำให้องค์กรสามารถสร้าง Private Database Cloud ภายใน Tenancy ตนเอง และสามารถกำหนดรอบเวลาการอัปเดตซอฟต์แวร์ (Maintenance schedules) รวมถึงการแยกชั้นความปลอดภัยได้อย่างเต็มที่
- ตัวเลือก B, C และ D ไม่ถูกต้องตามนิยามทางสถาปัตยกรรมของ Autonomous Database Dedicated"
        tags = @("core-services", "database", "autonomous-database", "dedicated-exadata")
        references = @(
            @{
                title = "Autonomous Database Dedicated Infrastructure"
                url = "https://docs.oracle.com/en-us/iaas/Content/Database/Concepts/adboverview.htm"
            }
        )
    },
    @{
        id = "oci-fnd-001-q068"
        domain = "Core OCI Services"
        subtopics = @("Autonomous Database, Base Database และ MySQL HeatWave ในระดับพื้นฐาน")
        difficulty = "medium"
        type = "single"
        scenario = $false
        question = "What is the unique capability of OCI MySQL HeatWave that distinguishes it from standard open-source MySQL databases?"
        options = @(
            @{ id = "A"; text = "It incorporates a built-in, massively parallel in-memory query acceleration engine that enables both OLTP transactions and high-speed OLAP analytics within a single MySQL database, eliminating ETL duplication." },
            @{ id = "B"; text = "It automatically translates MySQL queries into mainframe COBOL code." },
            @{ id = "C"; text = "It only supports static HTML web pages stored as BLOB objects." },
            @{ id = "D"; text = "It requires all table data to be stored on physical optical laser discs." }
        )
        correct_answer = @("A")
        explanation = "MySQL HeatWave เป็นบริการฐานข้อมูล MySQL บน OCI ที่มีเอนจินประมวลผลในหน่วยความจำแบบขนานขนาดใหญ่ (In-memory query accelerator) ในตัว ทำให้สามารถประมวลผลทั้งงานธุรกรรม (OLTP) และการวิเคราะห์ข้อมูลขนาดใหญ่ที่ซับซ้อน (OLAP) ได้อย่างรวดเร็วภายในฐานข้อมูลเดียว โดยไม่ต้องเสียเวลาและค่าใช้จ่ายในการทำ ETL ย้ายข้อมูลไปยัง Data Warehouse แยกต่างหาก
- ตัวเลือก B, C และ D ไม่ใช่คุณลักษณะของ MySQL HeatWave"
        tags = @("core-services", "database", "mysql-heatwave", "analytics")
        references = @(
            @{
                title = "Overview of MySQL HeatWave"
                url = "https://docs.oracle.com/en-us/iaas/mysql-database/doc/overview-mysql-heatwave.htm"
            }
        )
    },
    @{
        id = "oci-fnd-001-q069"
        domain = "Core OCI Services"
        subtopics = @("Autonomous Database, Base Database และ MySQL HeatWave ในระดับพื้นฐาน")
        difficulty = "medium"
        type = "multiple"
        scenario = $false
        question = "Which TWO statements are true regarding automated backups for Oracle Autonomous Database in OCI? (Choose TWO)"
        options = @(
            @{ id = "A"; text = "Autonomous Database automatically takes daily full backups and retains them in OCI Object Storage." },
            @{ id = "B"; text = "Customers can perform point-in-time recovery to any second within their backup retention window." },
            @{ id = "C"; text = "Automated database backups must be manually copied to external USB hard drives every evening." },
            @{ id = "D"; text = "Automated backups cause the database to temporarily shut down for 4 hours each night." },
            @{ id = "E"; text = "Autonomous Database does not support backups unless third-party software is purchased." }
        )
        correct_answer = @("A", "B")
        explanation = "คุณสมบัติของการสำรองข้อมูลอัตโนมัติบน Autonomous Database:
- (A) ระบบจะทำการ Backup ให้โดยอัตโนมัติทุกวันและจัดเก็บไว้บน OCI Object Storage อย่างปลอดภัย
- (B) ลูกค้าสามารถเลือกกู้คืนข้อมูลย้อนหลังตามจุดเวลาที่ต้องการได้แบบเจาะจงระดับวินาที (Point-in-time recovery) ภายในระยะเวลา Retention ที่กำหนด
- ตัวเลือก C ผิด เพราะเป็นการจัดการอัตโนมัติบนคลาวด์
- ตัวเลือก D ผิด เพราะการ Backup ทำงานในเบื้องหลังแบบออนไลน์โดยไม่มี Downtime
- ตัวเลือก E ผิด เพราะระบบ Backup รวมอยู่ในบริการของ OCI แล้ว"
        tags = @("core-services", "database", "autonomous-database", "backups")
        references = @(
            @{
                title = "Backup and Restore in Autonomous Database"
                url = "https://docs.oracle.com/en-us/iaas/Content/Database/Concepts/adboverview.htm"
            }
        )
    },
    @{
        id = "oci-fnd-001-q070"
        domain = "Core OCI Services"
        subtopics = @("Monitoring, Logging, Notifications และ Cloud Advisor")
        difficulty = "easy"
        type = "single"
        scenario = $false
        question = "Which OCI service is responsible for actively collecting, analyzing, and querying operational metric data (such as CPU, memory, and disk I/O) from OCI resources and triggering automated alarms when thresholds are crossed?"
        options = @(
            @{ id = "A"; text = "OCI Monitoring Service" },
            @{ id = "B"; text = "OCI Vault Service" },
            @{ id = "C"; text = "OCI Data Catalog" },
            @{ id = "D"; text = "OCI FastConnect Service" }
        )
        correct_answer = @("A")
        explanation = "OCI Monitoring Service เป็นบริการคลาวด์สำหรับรวบรวม ตรวจสอบ และวิเคราะห์ข้อมูลตัวชี้วัดประสิทธิภาพ (Metrics) เช่น การใช้งาน CPU, Memory, เครือข่าย และสตอเรจของทรัพยากรต่าง ๆ ใน Tenancy และสามารถตั้งค่าการแจ้งเตือน (Alarms) เมื่อค่า Metrics สูงเกินเกณฑ์ที่กำหนด
- ตัวเลือก B (Vault) ใช้จัดการกุญแจเข้ารหัส
- ตัวเลือก C (Data Catalog) ใช้จัดการ Metadata ของข้อมูล
- ตัวเลือก D (FastConnect) เป็นบริการเชื่อมต่อเน็ตเวิร์ก"
        tags = @("core-services", "observability", "monitoring", "alarms")
        references = @(
            @{
                title = "Monitoring Overview"
                url = "https://docs.oracle.com/en-us/iaas/Content/Monitoring/Concepts/monitoringoverview.htm"
            }
        )
    },
    @{
        id = "oci-fnd-001-q071"
        domain = "Core OCI Services"
        subtopics = @("Monitoring, Logging, Notifications และ Cloud Advisor")
        difficulty = "medium"
        type = "single"
        scenario = $true
        question = "A site reliability engineer (SRE) configures an alarm in the OCI Monitoring service to monitor compute instances. When CPU utilization exceeds 90%, the alarm must broadcast alert messages simultaneously to an engineering email distribution list and an on-call PagerDuty webhook. Which OCI service handles this broadcast delivery?"
        options = @(
            @{ id = "A"; text = "OCI Notifications Service" },
            @{ id = "B"; text = "OCI Internet Gateway" },
            @{ id = "C"; text = "OCI File Storage Service" },
            @{ id = "D"; text = "OCI Block Volume Clones" }
        )
        correct_answer = @("A")
        explanation = "OCI Notifications Service เป็นบริการส่งข้อความแบบ Publish/Subscribe (Pub/Sub) ที่รับข้อความแจ้งเตือนจากระบบต่าง ๆ (เช่น Alarms หรือ Events) ผ่าน Topic แล้วกระจายไปยังปลายทางที่เป็นผู้รับ (Subscriptions) ได้หลายรูปแบบพร้อมกัน เช่น Email, Slack, PagerDuty, SMS หรือ HTTPS Webhook
- ตัวเลือก B, C และ D ไม่ใช่บริการส่งข้อความแจ้งเตือน"
        tags = @("core-services", "observability", "notifications", "scenarios")
        references = @(
            @{
                title = "Notifications Overview"
                url = "https://docs.oracle.com/en-us/iaas/Content/Notification/Concepts/notificationoverview.htm"
            }
        )
    },
    @{
        id = "oci-fnd-001-q072"
        domain = "Core OCI Services"
        subtopics = @("Monitoring, Logging, Notifications และ Cloud Advisor")
        difficulty = "medium"
        type = "single"
        scenario = $true
        question = "A cloud security architect needs a single centralized platform in OCI to ingest, search, analyze, and manage log data from multiple sources, including OCI Audit logs, VCN Flow Logs, and custom application log files generated by compute virtual machines. Which service provides this centralized logging management?"
        options = @(
            @{ id = "A"; text = "OCI Logging Service" },
            @{ id = "B"; text = "OCI Compute Instance Configurations" },
            @{ id = "C"; text = "OCI DNS Steering Policies" },
            @{ id = "D"; text = "OCI Local Peering Gateway" }
        )
        correct_answer = @("A")
        explanation = "OCI Logging Service เป็นบริการส่วนกลางที่รวบรวม ค้นหา และวิเคราะห์ล็อกทั้งหมดใน Tenancy ได้จากที่เดียว โดยแบ่งล็อกเป็น 3 ประเภทหลัก:
1. Audit Logs: บันทึกการเรียกใช้ API ทั้งหมด
2. Service Logs: ล็อกจากบริการ OCI เช่น VCN Flow Logs, Load Balancer Logs, Object Storage Logs
3. Custom Logs: ล็อกที่ส่งมาจากแอปพลิเคชันหรือเซิร์ฟเวอร์ Compute
- ตัวเลือก B, C และ D ไม่ใช่บริการจัดการและค้นหาบันทึกระบบ"
        tags = @("core-services", "observability", "logging", "audit")
        references = @(
            @{
                title = "Logging Overview"
                url = "https://docs.oracle.com/en-us/iaas/Content/Logging/Concepts/loggingoverview.htm"
            }
        )
    },
    @{
        id = "oci-fnd-001-q073"
        domain = "Core OCI Services"
        subtopics = @("Monitoring, Logging, Notifications และ Cloud Advisor")
        difficulty = "easy"
        type = "single"
        scenario = $false
        question = "Which built-in OCI service scans a customer's cloud tenancy and automatically provides actionable recommendations to optimize costs, enhance security, increase system performance, and improve high availability?"
        options = @(
            @{ id = "A"; text = "OCI Cloud Advisor" },
            @{ id = "B"; text = "OCI Bastion Service" },
            @{ id = "C"; text = "OCI Network Visualizer" },
            @{ id = "D"; text = "OCI Container Registry" }
        )
        correct_answer = @("A")
        explanation = "OCI Cloud Advisor เป็นบริการอัจฉริยะที่คอยตรวจสอบทรัพยากรใน Tenancy ของลูกค้าโดยอัตโนมัติ และให้คำแนะนำ (Actionable recommendations) ใน 4 มิติหลัก ได้แก่: การลดต้นทุน (Cost optimization), การปรับปรุงความปลอดภัย (Security), การเพิ่มประสิทธิภาพ (Performance) และการยกระดับความพร้อมใช้งาน (High Availability)
- ตัวเลือก B (Bastion) คือระบบรีโมต SSH ปลอดภัย
- ตัวเลือก C (Network Visualizer) คือการแสดงแผนผังเน็ตเวิร์ก
- ตัวเลือก D (Container Registry) คือที่เก็บ Docker Image"
        tags = @("core-services", "management", "cloud-advisor", "optimization")
        references = @(
            @{
                title = "Overview of Cloud Advisor"
                url = "https://docs.oracle.com/en-us/iaas/Content/CloudAdvisor/Concepts/cloudadvisoroverview.htm"
            }
        )
    },
    @{
        id = "oci-fnd-001-q074"
        domain = "Core OCI Services"
        subtopics = @("Monitoring, Logging, Notifications และ Cloud Advisor")
        difficulty = "medium"
        type = "multiple"
        scenario = $true
        question = "A DevOps team wants to build an automated event-driven workflow: whenever a user uploads a new image into an OCI Object Storage bucket, a notification must be sent and an automated image processing pipeline must execute. Which TWO OCI services can act as direct action targets for an OCI Events rule? (Choose TWO)"
        options = @(
            @{ id = "A"; text = "OCI Functions" },
            @{ id = "B"; text = "OCI Notifications topic" },
            @{ id = "C"; text = "OCI Local Peering Gateway" },
            @{ id = "D"; text = "OCI Storage Gateway Appliance" },
            @{ id = "E"; text = "OCI Cloud Shell Linux Terminal" }
        )
        correct_answer = @("A", "B")
        explanation = "OCI Events Service ช่วยตรวจจับการเปลี่ยนแปลงของทรัพยากรใน Tenancy ตามมาตรฐาน CloudEvents และสามารถส่งข้อมูลไปยัง Action Targets ได้แก่:
- (A) OCI Functions: สั่งรันโค้ด Serverless ทันทีเพื่อประมวลผลไฟล์
- (B) OCI Notifications Topic: ส่งข้อความแจ้งเตือนต่อไปยัง Email หรือ Webhook
นอกจากนี้ยังรองรับ OCI Streaming อีกด้วย
- ตัวเลือก C, D, และ E ไม่ใช่ Action Target ที่รองรับโดยตรงใน Events Service"
        tags = @("core-services", "observability", "events", "automation")
        references = @(
            @{
                title = "Overview of Events"
                url = "https://docs.oracle.com/en-us/iaas/Content/Events/Concepts/eventsoverview.htm"
            }
        )
    },
    @{
        id = "oci-fnd-001-q075"
        domain = "Core OCI Services"
        subtopics = @("การเลือกบริการให้เหมาะกับ Use Case")
        difficulty = "hard"
        type = "single"
        scenario = $true
        question = "A cloud infrastructure architect wants to implement automated Infrastructure as Code (IaC) to consistently deploy and manage VCNs, compute instances, and database systems across multiple development and production environments. The architect wants an Oracle-managed cloud service that natively executes open-source HashiCorp Terraform configuration scripts without having to install or maintain local Terraform software. Which OCI service fulfills this requirement?"
        options = @(
            @{ id = "A"; text = "OCI Resource Manager" },
            @{ id = "B"; text = "OCI Compute Autoscaling" },
            @{ id = "C"; text = "OCI Dynamic Routing Gateway" },
            @{ id = "D"; text = "OCI Vault Secret Manager" }
        )
        correct_answer = @("A")
        explanation = "OCI Resource Manager คือบริการจัดการ Infrastructure as Code (IaC) แบบ Fully Managed ของ Oracle ที่ขับเคลื่อนด้วย HashiCorp Terraform ช่วยให้ทีมงานสามารถสร้าง แก้ไข และจัดการทรัพยากร OCI ผ่านไฟล์คอนฟิก (Terraform scripts / Stacks) ได้อย่างเป็นระบบ มีระบบ State File Locking และประวัติการรันงานโดยไม่ต้องติดตั้งซอฟต์แวร์ Terraform บนเครื่องตนเอง
- ตัวเลือก B (Autoscaling) ใช้เพิ่มลดจำนวนเครื่อง Compute
- ตัวเลือก C เป็นอุปกรณ์เราเตอร์เสมือน
- ตัวเลือก D ใช้จัดเก็บรหัสผ่านและ Secret"
        tags = @("core-services", "resource-manager", "terraform", "iac", "scenarios")
        references = @(
            @{
                title = "Overview of Resource Manager"
                url = "https://docs.oracle.com/en-us/iaas/Content/ResourceManager/Concepts/resourcemanager.htm"
            }
        )
    }
)
