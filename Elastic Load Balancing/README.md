https://aws.amazon.com/elasticloadbalancing/features/#Product_comparisons

# Load Balancer
Load balancing refers to the process of distributing tasks across a set of resource.
the load balancer needs to take all the traffic and redirect it to the backend servers based on an algorithm.
Regional service and highly available.
Auto-scale.
Internal LB route requests from clients with private IP address to targets with a private IP address

# Elastic Load Balancer

Features
- Hybrid mode: also load balances to on-premises servers.
- High availability: the load balancer's targets are deployed across multiple Availability Zones.
- Scalability: scales to meet the demand of the incoming traffic.
- This is a regional service
- For secure connections use AWS Certificate Manager to manage certificates. With certificate you are able to establish SSL or TLS connections
- SNI: Used to manage multiple certificates to connect with multiple domains in differents target groups, all behind the same Load balancer. SNI match the request to a domain with the correct Certificate, encrypt the traffic and send it to the correct target group.

### Health checks 
HC to route traffic to only healthy EC2 instances. HC works at the Target group level.

Types:
- Establishing a connection to a backend EC2 instance using TCP and marking the instance as available if the connection is successful. BUT , only verifying that the port of an application is open doesn’t mean that the application is working
- Making an HTTP or HTTPS request to a webpage that you specify and validating that an HTTP response code is returned. BUT, making a call to the home page of an application is the right way either.

A way to strengthen the health check is to create a **monitoring webpage**, such as /monitor. It will make a call to the database to ensure that it can connect, get data, and make a call to Amazon S3. Then, you point the health check on the load balancer to the /monitor page.

### ELB components

- rules: source IP address of the client. target group to send the traffic to
- listeners: The client connects to the listener. This is often called client side. There can be many listeners for a single load balancer. in the listener configurarion you must define which target group forward the traffic. For HTTPS listener you must specify a default certificate from ACM (reccommended), IAM or imported.
- target groups: This is where you define the type of backend you want to direct traffic to. Also, a health check must be defined for each target group. You can link an Instance to a LB´s security group instead of link to the load balancer. You can use the route tables to redirect traffic to different target group: based on path in URL (ex.com/user, ex.com/orders), based on hostname (a.ex.com, b.ex.com) or based on query string headers (ex.com/user=125&order=5)
    - EC2 Instances
    - ECS Task
    - Lmabda functions
    - IP Address

## Types of load balancers

![load_balancers](/img/load_balancers.png)

#### Application Load Balancer (ALB)
- Load balancing HTTP and HTTPS traffic
- An Application Load Balancer can **authenticate users** before they can pass through the load balancer.
- Rich metrics and logging
- It can send a redirect to the client. This is useful when you must redirect to a specific website or redirect a request from HTTP to HTTPS.
- Layer 7
- Send responses directly to the client with a fixed response
- makes routing decisions based on the HTTP and HTTPS protocol. This facilitates granular routing to target groups.
- TLS offloading using a SSL Certificate. This ensures that the traffic between the client and Application Load Balancer is encrypted.
- Supports sticky sessions: If requests must be sent to the same backend server because the application is stateful, use the sticky session feature. This feature uses an HTTP cookie to remember which server to send the traffic to across connections. Use case: User doesn´t lose the session data. You can enable this option in the configuration of the target group.
- The Application Load Balancer has individual nodes running in each Availability Zone that are configured with the Application Load Balancer. 
- Internal:  to balance loads between the layers of a multi-tier application
- Extertnal: to balance loads inside the Amazon VPC
- Cross-zone load balancing is enabled by default and can be disabled at the target group level. This load balancing enabled  means that every instance in each zone get the same percentage of traffic from the nodes of the load balancers, even wheter an AZ have more instances than other.
- Supports SNI with multiple listeners

#### Network Load Balancer (NLB)
- TCP and User Datagram Protocol (UDP) connection based
- Layer 4
- Source IP preservation
- Ultra-Low latency and high performance (millions of request per seconds)
- Supports Sticky sessions: Routes requests from the same client to the same target without cookies. Use case: User doesn´t lose the session data
- Automatically provides a static IP address per Availability Zone (subnet), you can use an Elastic IP for each AZ.
- DNS: Uses Amazon Route 53 to direct traffic to load balancer nodes in other zones.
- Target group: EC2 Instances, IP addresses (private) or Application load balancer
- Cross-zone load balancing is disabled by default and can be enabled at the load balancer level
- Supports SNI with multiple listeners

#### Gateway Load Balancer (GLB) 
It provides a gateway for distributing traffic across multiple virtual appliances while scaling them up and down based on demand.
- Layer 3 gateway and Layer 4 load balancing
- Health checks
- Gateway Load Balancer Endpoints
- Higher availability for **third-party** virtual appliances
- Can be monitored using CloudWatch metrics.
- Connects internet gateways, virtual private clouds (VPCs), and other network resources over a private network.
- Use case: Analyze network traffic with 3rd party security appliances
- Uses the GENEVE protocol on port 6081
- Target group: EC2 Instances or IP addresses (private)
- Cross-zone load balancing is disabled by default and can be enabled at the load balancer level

Gateway Load Balancer endpoints 
- Gateway Load Balancers use Gateway Load Balancer endpoints to securely exchange traffic across VPC boundaries. 
- A Gateway Load Balancer endpoint is a VPC endpoint that provides private connectivity between virtual appliances in the service provider VPC and application servers in the service consumer VPC. 
- You deploy the Gateway Load Balancer in the same VPC as the virtual appliances. You register the virtual appliances with a target group for the Gateway Load Balancer.

#### Classic Load Balancer (CLB)
This is the legacy load balancer for AWS.
Classic Load Balancers are not recommended for use unless you have legacy services or applications that need the Classic Load Balancer.

# Auto Scaling Groups
- Automatically register new instances to a load balancer
- If any instances is deemed unhealthy, it is terminated. and a new instance is created to replace it.
- Free, only pay for the instances.
- Set parameters: minimun capacity, desire capacity and maximun capacity
- Define a launch template that contains how to launch every instance within the ASG: IAM, security groups, User data, EBS volumes, SSH Key pair, networking, LB, so on.
- Autoscale based on CloudWatch alarms (using metrics like: CPU utilization, Request count per target, average network in/out or any custom metric)