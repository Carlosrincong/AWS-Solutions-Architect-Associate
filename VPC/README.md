https://docs.aws.amazon.com/vpc/latest/userguide/default-vpc.html

- IPv4: you don’t see an IP address in its binary format. Instead, it’s converted into decimal format in octets and noted as an IPv4 address.
- CIDR: CIDR notation is a compressed way of representing a range of IP addresses. Specifying a range determines how many IP addresses are available to you. In AWS, the smallest IP range you can have is /28, which provides 16 IP addresses. The largest IP range you can have is a /16, which provides 65,536 IP addresses. In order of being likely to need the most IP addresses to the least, the three-tier VPC architecture is as follows: 1. Private (Applications) 2. Private (Data) 3. Public
- For communications between Amazon VPC, hub-and-spoke topologies are preferred over many-to-many mesh
- You never need to worry about this router, it just works, and it's managed by AWS to route traffic between subnets in your Amazon VPC. 
- Networking layers:
    - Layer 3 adds cross networking addressing. 
    - Layer 4 adds the functionality to support the networking used on the internet.
    - Layer 7 adds protocols and functions at the software level for applications.
- The Region in which you place your infrastructure impacts costs and, depending on where your end users live, latency. 
- Tenancy enabled in a VPC forces everything resource in the vpc to be in dedicated instances.
- AWS provides load balancers to achieve high availability, fault-tolerance, and scaling, and also custom Amazon VPCs where two subnets can be configured, each in a separate Availability Zone which creates a Multi-AZ design.  
- You cannot alter or modify the CIDR block of a deployed Amazon VPC, so it is better to pick a CIDR block that has more IP addresses than needed
-  the CIDR range used in Amazon VPC must not overlap or cause a conflict with the CIDR block in the on-premises data center.

# VPC
VPC is an isolated network that you create in the AWS Cloud, consist of: VPC name + CIDR + Region (regional service)
Every instance must live inside of a VPC
The same VPC can have more than one CIDR block (up to 5)

- Default VPC: AWS Creates VPCs in every region by Default in the Default VPC. Each default Amazon VPC creates a public subnet within each Availability Zone within the supported Region. Any resource that you put inside the default VPC will be public and accessible by the internet.
- Custom VPCs is more secure and provide more granular access to the internet. This is a regional service. Amazon VPC must be explicitly defined when you create it; nothing is allowed in or out without explicit configuration. 

## Subnets
-   Subnets are used to provide high availability and connectivity options for your resources. Use a public subnet for resources that must be connected to the internet and a private subnet for resources that won't be connected to the internet.
-   Subnet consist of: VPC + Availability Zone + CIDR. 
-   A best practice to maintain redundancy and fault tolerance, create at least two subnets configured in two Availability Zones.
-   AWS reserves five IP addresses in each subnet, the first 4 and the last one. These IP addresses are used for: VPC local routing, Domain Name System (DNS), Future use, network broadcast address and network address.
-   Subnets are created in Availability Zone level and can be more than one in each AZ.
-   CIDR provides more granular control of the number of addresses you assign to each subnet.

## Route Table
A route table contains a set of rules, called routes, that are used to determine **where network traffic is directed**.
Route Table can be attached to a subnet. Not to a VPC
#### Main route table
- When you create a VPC, AWS creates a route table called the main route table. 
- The default configuration of the main route table is to allow traffic between all subnets in the local network
- You can add, remove, and modify routes in the main route table.
- The main route table is used implicitly by subnets that do not have an explicit route table association like a Custom route table.
####  Custom route table
- Each custom route table that you create will have the local route already inside it, allowing communication to flow between all resources and subnets inside the VPC. 
- You can protect your VPC by explicitly associating each new subnet with a custom route table and leaving the main route table in its original default state.
- If you want allow internet access (make public a subnet) you must to create the rule in the route table from the subnet to internet gateway (IGW)
- This type of routes can be defined in the Route rable: IGW (internet access for a Public subnet), NAT Gateway (internet access for a Private subnet), VPC Peering (Connect two VPCs), Virtual Private Gateway VGW (VPN or Direct Connectivity)
- Destination (IP where you want send traffic), Target (Service when the traffic is sent)

## Security
#### IAM 
IAM lets you control who (group, user or role) can configure and manage your Amazon VPCs with IAM Policies or IAM Roles.
#### Access control list (ACL)
Think of a network access control list (network ACL) as a virtual firewall at the subnet level. 
Allow and deny type of rules are allowed to be defined in the ACL.
Network ACLs are considered stateless, so you need to include both the inbound and outbound ports used for the protocol
The default network ACL allows all traffic in and out by default.
- Default network ACL: configured by default to allow incoming and outgoing traffic. Not modify this NACL, instead create a custom NACL.
- Custom network ACL
Lower number means higher precedence. And the first rule match will drive the decision. The rules must have steps of 100 betweem them.
#### Security group
Security group is an instance level firewall that will allow traffic to reach the instance (resource level).
SG is not optional when an instance is created.
The default configuration of a security group blocks all inbound traffic and allows all outbound traffic. 
To allow inbound traffic, you must create inbound (only allow) rules.
A common design pattern is to organize resources into different groups and create security groups for each to control network communication between them.
SG are Statefull 
security groups are not capable of explicitly blocking traffic. If you need to block a certain IP address or a block of IP addresses, you will require assistance from network ACLs.

![security_groups](/img/security_groups.jpg)

    Route tables to control outbound traffic mainly and Security (ACL and Security Group) to control how traffic ingress to vpc

## Gateways
#### Internet gateway (IGW)
You must create an internet gateway to connect your VPC to the internet.
NAT translates private IP addresses to public IP addresses, ensuring communication out to the internet.
An Amazon VPC can have only one internet gateway (opens in a new tab) at a time, and it is a regional resilient service ensuring high availability. 
The only architectural difference between a public and private subnet is that a public subnet has a route to an internet gateway. For public subnet enable auto-assign public ipv4 address.
###### Bastion Host
- Bastion Host is an Instance in the public subnet with their own security group (BastionHost-SG). This instance have access to the EC2 instances in te private subnet. Users firt connect vis SSH to the Bastion Host,  then via SSH connect to the Private Instances. 
- The key is that the Bastion Host must be have access to the internet and limited from potencial IP Users throught Security group.
- The security group pf the private instances must allow the security group of the bastion host.
###### NAT Instance (not recomended)
NAT is Network Address Translation.
Allow private ec2 instances connect to internet. 
NAT instance must be launched in a public subnet and attached an Elatic IP address
The route table  of the private subnet must contain a rule that sends traffic to NAT instance when the trafficgoes to 0.0.0.0/0
#### Virtual private gateway
A virtual private gateway connects your VPC to another private network.
When you have both gateways, you can then establish an encrypted virtual private network (VPN) connection between the two sides.
#### Transit Gateway
Manage and simplify connections and peering for your Amazon VPCs
#### NAT Gateway (recoomended instead of NAT instance)
NAT Gateway is a managed services that uses an Elastic IP address
Service per Availability zone
NAT Gateway is only used by services in other subnets
Requires a Internet Gateway (IGW), therefore this works like that: private subnet 1-> NATGW -> IGW. Where 1-> is a coonnection stablished in the route table
Fault tolerancy: Create multiple NAT Gateway in multiple AZ

## Monitor
#### Amazon VPC Flow Logs
VPC flow logs capture information about IP traffic going to and from network interfaces in your Amazon VPC.
Helps us to resolve connectovity issues
Once you've set up a flow log for your Amazon VPC, you can designate an Amazon S3 bucket, CloudWatch or Kinesis Data Firehose to store them in. 
Those logs can then be reviewed manually or even handled by a data processing solution to automate detection of problems in your network traffic.
Logs: VPC level, Subnet level and Network Interface level

Syntax:
- srcaddr & dstaddr - help identify problematic IP
- srcport & dstport - help identify problematic port
- Action - success or failure of the request due to security group or NACL

#### VPC Traffic Mirroring
#### Amazon CloudWatch

## Connectivity
AWS provides services and hybrid connectivity solutions to link your on premises and AWS networks.
Hybrid:
- AWS Direct connect
- AWS managed VPN
- AWS Transit Gateway
- Self-managed VPN
VPC to VPC:
- AWS Backbone (public communication)
- VPC Peering
- AWS Privatelink
- AWS transit Gateway
- VPN

### ------------- Hybrid

#### AWS Direct Connect (DX)
To establish a secure physical connection between your on-premises data center and your Amazon VPC, you can use AWS Direct Connect.
You can choose to connect to a Collocation, Direct Connect Partner (Who has connectivity with the AWS collocation) or Direct Connect Node.
Connection types:
- Dedicated: There are tree types of Ethernet connections: 1 gb per second, 10 gb per second and 100 gb per second.
- Hosted: There are tree types of Ethernet connections: 50 mb per second, 500 mb per second and 10 gb per second.

Connection is stablished with BGP and optional BFD.
Direct connect suports IPv4, IPv6 or both.
Define the Virtual Interfaces: Private, Public or Transit.
Setup two Routers in the AWS Direct connect location for Highly available hybrid network connections. This eliminate the single points of failure when you have only one router in the AWS Direct Connect Location.
Connection can be establist in time longer than 1 month 
Data in transit is not encrypted but it is private. For a IPsec-encrypted private connection use Direct Connect with VPN
A Virtual Private Gateway (VPGW) is requerired in the VPC 
High resiliency fir critical workloads

- Increase the bandwidth throughput- working with large datasets
- Consistent network experience

###### Direct Connect Gateway
To set up DX to one or more VPC in many regions and same account

#### AWS Client VPN
AWS Client VPN enables you to securely connect users (or remote teams) to AWS or on-premises networks
The Client VPN administrator creates and configures a Client VPN endpoint in AWS. Your administrator controls which networks and resources you can access when you establish a VPN connection. 
Client VPN supports IPv4 traffic only.
The client CIDR range cannot be changed after you create the Client VPN endpoint. 
The subnets associated with a Client VPN endpoint must be in the same VPC.
Client VPN publishes metrics to CloudWatch for your Client VPN endpoints. Metrics are published to CloudWatch every five minutes.

#### AWS Site-to-Site VPN
AWS Site-to-Site VPN enables you to securely connect your on-premises network to Amazon VPC.
VPN connection consists of two tunnels. Each tunnel terminates in a different Availability Zone on the AWS side, but it must terminate on the same customer gateway on the customer side. 
when you connect your VPCs to a common on-premises network, we recommend that you use nonoverlapping CIDR blocks for your networks.
VPN metric data is automatically sent to CloudWatch as it becomes available.
- S2S VPN Connection is established between Virtual Private Gateway (VPGW) in AWS and there are two options in the client side:
    -  Customer Gateway (CGW: software or physucal connection) with a public IP address in the customer Data center.
    -  NAT Device with their Public IP Address connected to an internal Customer Gateway and their private IP address. All in the customer Data center. 
- IMPORTANT: enable Route propagation for the VPGW in the route table that is associated with the subnets
![vpn_architecture](/img/vpn_architecture.png)

###### AWS VPN CloudHub
In case the customer have multiple data centers on-premise each with their own Customer gateway.
- Low cost hub-and-spoke model
- This model allow each data center comunicate with the others throught that VPN connection
- Traffic goes over the public internet
- set-up: connect each site with the same VPGW, setup dynamic routing and configure route tables.

#### AWS Cloud WAN
Connections between on premise network and AWS VPC

### --------------- VPC to VPC

#### VPC Peering
VPC peering is a way to link multiple Amazon VPCs together and allows direct and private communications between two isolated Amazon VPCs using their private IP addresses across different AWS Regions. This service is not scalable, for scalability use Transit gateway.
This communication is accomplished using private IP addresses, without requiring gateways, VPN connections, or separate network appliances.
Traffic never traverses the public internet
VPC peering connection is **nontransitive** in nature and does not allow network traffic to pass from one peering connection to another.
You cannot create a VPC peering connection if the VPCs have matching or overlapping IPv4 CIDR blocks. 
If either VPC in a peering relationship has one connection (VPN, Direct, NAT, IGW, VPC Endpoint), you cannot extend the peering relationship to that connection.
With VPC Peering you can replicate data from one VPC to another and the traffic never traverses the public internet,
Route table must be updated in each VPC network to ensure communication between them
VPCs can be in different accounts/regions

#### AWS Transit Gateway
Manage and simplify connections and peering for your Amazon VPCs. Provides interconnectivity between VPCs and your on-premises network (With a VPN or Direct Connection), such as a hub-and-spokes architecture. 
Transit gateways adds scalability, connectivity, better visibility and control, and improved security over peering connections. 
A transit gateway has a default route table and can optionally have additional route tables.
for routing traffic between VPCs in different Region, transit gateway peering connections have a simpler network design and more consolidated management, compared to VPC Peering.
Transit gateways are a regional service and support a hub-and-spoke network design within the Region in which they are deployed. 

This removes the need to route traffic over the internet:
- In a Region, AWS Transit Gateway creates a one-to-many peering connection through a central hub, in a hub-and-spoke network architecture. Where the Transit Gateway is the hub and the vpcs, VPN and Direct connections are the spokes. 
- Inter-Region peering connects all AWS Transit Gateways together using the AWS global network and each Transit Gateway is connected to their VPCs in their respective region. Transit gateway inter-Region peering is nontransitive.

#### VPC Peering Vs Transit Gateway
VPC peering connections, unlike transit gateways, have no aggregate bandwidth restriction. 
transit gateway will incur a VPC connection and data transmission charge. VPC peering connections only incur a data transmission charge. 

#### VPC EndPoints
Connects your VPC to supported AWS services and VPC endpoint services using a private network. 
Resources inside a VPC do not require public IP addresses to communicate with resources outside the VPC.
Traffic does not leave the Amazon network.
A VPC endpoint does not require an internet gateway, virtual private gateway, NAT device, VPN connection, or Direct Connect connection. Types:
- Gateway VPC endpoints (free): A gateway VPC endpoint targets specific IP routes in a VPC route table in the form of a prefix list. Supports s3 and DynamoDB.
- Interface endpoints (Powered by PrivateLink): private IP address from the IP address range of your subnet, which serves as an entry point for traffic destined to a supported AWS service or a VPC endpoint service. When an interface endpoint is created, endpoint-specific DNS hostnames are generated that can be used to communicate with the service. After creating the endpoint, you can submit requests to the provider’s service through one of the following three methods: Endpoint-specific regional DNS hostname, Zonal-specific DNS hostname and Private DNS hostname. Supports mos of AWS resources. Use for s3/DyanoDB only when the connectovity is hybrid or from another VPC. 
- Gateway Load Balancer endpoint (Powered by PrivateLink): You specify a Gateway Load Balancer endpoint as a target for a route in a route table. 

#### AWS PrivateLink
AWS PrivateLink provides a secure and private connection between your VPCs, supported AWS services and your on premise network, AWS PrivateLink gives on-premises networks private access to AWS services through Direct Connect. 
Avoids exposing traffic to the public internet.
All without VPC Peering or an Internet Gateway (NAT), and its complexity associated.  There is no need to configure an internet gateway, VPC peering connection, or manage VPC CIDRs. 
It provides a more secure connection for services across different accounts and Amazon VPCs, with no need for firewall rules, path definitions, or route tables. 


## Edge Networking
On AWS, edge networking services securely transmit your user-facing data with improved latency globally. When you use the AWS edge networking services, your traffic moves off the internet and behind the AWS global network. AWS edge networking services sit at the AWS global edge locations and are configured to connect and deliver data with single-digit millisecond AWS network latency.
#### Amazon CloudFront
CDN
#### Amazon Route53
DNS
#### AWS Global Accelerator
Optimizes user traffic, from the user to the application.
#### AWS Shield Standard
Defends traffic from DDoS and malicious web attacks
#### AWS WAF
Application protection by using rules.

## Application Networking
work together to solve your application networking needs.
#### Amazon API Gateway
Creates, mantain and secures APIs at any scale
#### AWS App Mesh
Connect containers and microservices with application-level networking
#### AWS Cloud Map
Discover access to the most recent resources and services
#### Elastic Load Balancing

## Network Security
AWS provides your network and application security teams with services that address their particular protection needs and compliance requirements.
- Protect your environment.
- Inspect and filter traffic to prevent unauthorized access.
- Enforce fine-grained security policies at every network control point across your organization.
- Meet compliance requirements.

#### AWS Firewall manager
Centralize the way of manage and configure the firewall fules
#### AWS Shield
Defends traffic from DDoS and malicious web attacks
#### AWS WAF
Protects WebApps from common web exploits
#### AWS Network Firewall
Set up network security acces at VPC-level


# BP
- a common practice to connect to a Data base used in a Three tier web app is using a bastion instance. This istance is in the public subnet, is internet facing and have connectovity with the database. Other service required is setup a NAT server in the public subnet to allow the traffic from de databse to send pachages to internet. You need to define a route in the private route table to direct the internet traffic to the NAT server in the public subnet. 
Use the virtual private gateway to stablish a on premise connectivity to the database, and add a reoute in the private route table to direct traffic which pretend to reach the on premise CIDR Block through the virtual private gateway. In this case you dont use the bastion instance.

# multi-tier architecture
- Single-tier VPC for applications: 
    - Doesn't use any private data
    - Can be unavailable for extended periods if something fail
    - Will only ever be used by you
- N-tier VPC  to limit access and tight coupling as much as possible. 
- Complex designs with connectivity and peering options
