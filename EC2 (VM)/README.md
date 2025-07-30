https://aws.amazon.com/ec2/
https://aws.amazon.com/ec2/pricing/
https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/AMIs.html
https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/ec2-instance-lifecycle.html
https://aws.amazon.com/ec2/autoscaling/

# EC2
Amazon EC2 is a web service that provides secure, resizable compute capacity in the cloud. With this service, you can provision virtual servers called EC2 instances. 

For high availability, consider using at least two EC2 instances in two separate Availability Zones.

You must define the following: 
- Hardware specifications: 
    - Instance type: CPU, Memory (RAM) and GPU (optional). 
    Instance families: 
        - General purpose: Balanced requirements
        - Compute optimized (c): CPU intensive, high performance processors, media trascoding, batch processing workloads, dedicated gaming servers or machine learning.
        - Memory optimized (r): process large datset in memory (RAM), databases, cache store, in-memory databases optimized for BI
        - Accelerated computing
        - Storage optimized (i, g, h): access large dataset on local storage, OLTP systems, databases, in-memory databases, data warehouse, file systems
        - HPC optimized
    - network (VPC)
    - storage (EBS Volume, EFS and Lifecycle Manager)
- Logical configurations: 
    - Networking location (VPC)
    - firewall rules (Security Group)
    - authentication (Key Pairs)
    - operating system or AMI: Linux, Windows or MacOS
    - User data: script which run once the instance is first started. Execute on the first launch ot the instance.

You can scale capacity as needed, both up and down. This means that if you need more memory, processing, or storage, you can add it.

Use case:
- you can use instances for long-running, stateful applications.
- You can determine the type and size or your storage, whether to use block or file storage.
- workloads with heavy computational requirements.
- Migrating from on premise

# Amazon Machine Image (AMI)
EC2 instances are live instantiations (or versions) of what is defined in an Amazon Machine Image (AMI)
you can create an AMI from your running instance and use the AMI to start a new instance.

AMIs can comes from:
- AMIs created by AWS
- AWS Marketplace AMIs from third-party vendors
- AMIs are created from your EC2 instances.
- Community AMIs are provided by the AWS user community
- Build your own custom image with EC2 Image Builder

# EC2 Life Cycle
![LifeCycle](/img/lifecycle2.png)

# Pricing
We recommend Savings Plans over Reserved Instances

- On-Demand instances: only pay the specified hourly rates for the instance that you use. Recommended for short-term and un-interrupted workloads.
- Spot instances (---): Users with fault-tolerant, short workloads or stateless workloads. Instance can be terminated in any time. 
    - Use case: batch jobs, Data analysis, image processing. No for critical jobs or databases.
    - To get a Spot Instance you must to set a max spot price you are able to pay. And when the price is less than that price you get the instance. when the price is greater than the max spot price, The instance will stop/terminate within 2 minutes. 
    - If you want to cancel/terminate an spot instance, first you must to cancel the spot request and then terminate the spot instance.
    - Spot fleet = spot instances + On demand instances (optional). Allow us to request instances automatically at the lowes price.
    - In sport request option you can see the pricing history
- Saving plans (--):  low usage prices for a 1-year or 3-year term commitment to a consistent amount of usage. You chooser certain instance type and region.
- Reserved instances (-): long workloads. You reserve for a period (1 or 3 years) specific instance attribute such as: tenancy, instance type, regions or zone, OS, so on. You can buy or sell the reservation. You can choose an convertible reserved instance.
- Dedicated hosts (+++): book an entire physical server. You control instance placement. Compliance requirements or complicated licensing model. There are two options: Ondemand or reserved.
- Dedicated instances (+): may share your hardware with other instances.
- You are not billed if an instance is in a stopped state.
- A best practice is combine regional reserved instances and saving plans
- Capacity reservation: to tell to AWS that you need a capacity availaible to use. You pay for this reservation even if you dont use

## Availability

Instances offer at least 99.99% (four nines) of availability
To increase availability, you need redundancy. This typically means more infrastructure—more data centers, more servers, more databases, and more replication of data. 

High availability involves the following challenges:
- Replication process: replicate the configuration files, software patches, and application across instances. The best method is to automate where you can.
- Customer redirection:  The most common is using a Domain Name System (DNS) where the client uses one record that points to the IP address of all available servers. Another option is to use a load balancer, which takes care of health checks and distributing the load across each server.
- Types of high availability
    - active-passive: only one of the two instances is available at a time. One advantage of this method is that for stateful applications 
    - active-active: A disadvantage of an active-passive system is scalability. Both servers are available, the second server can take some load for the application, and the entire system can take more load. Stateless applications work better for active-active systems.

## Auto Scaling

- Vertical Scaling: Increase the instance size, while the instance is in a stopped state. With active-passive systems, you need vertical scaling. 
Stop the passive instance and increase the size. Then shift the tfraffic from active to passive instance. finally, stop and change the size of the other instance.
it’s actually a lot of manual work. Another disadvantage is that a server can only scale vertically up to a certain limit.
- Horizontal Scaling: Add additional instances. Ideal for active-active systems.

Features:
- Automatically scales in and out based on demand.
- Scales based on user-defined schedules.
- Automatically replaces unhealthy EC2 instances.
- Uses machine learning (ML) to help schedule the optimum number of EC2 instances.

Components:
- Launch template (recommended) and configuratios: It also supports versioning, which can be used for quickly rolling back if there's an issue or a need to specify a default version of the template. Create a template: from an existing template, from an existing instance or creating directly.
- Amazon EC2 Auto Scaling groups: Minimum capacity, Desired capacity (initial state) and Maximum capacity
- Scaling policies:
    - simple: You use a CloudWatch alarm and specify what to do when it is invoked.
    - step: Step scaling policies respond to additional alarms even when a scaling activity or health check replacement is in progress
    - target tracking scaling: If your application scales based on average CPU utilization, average network utilization (in or out), or request count, then this scaling policy type is the one to use. All you need to provide is the target value to track, and it automatically creates the required CloudWatch alarms.

![autoscaling](/img/auto_scaling_group.png)

# Networking 
- Allocate and associate an IP Address to an instances if you want a fix public ip address 

## Placement groups
Types:
- Cluster: all instance are in the same AZ for low latency (10 Gps). There is no hight availability. Use case: Bid data jobs, Application that needs extremely low latency and high networkin throughput
- Spread: minimize the failure risk with the instances in different AZ. Limited to 7 instances per ZA per Placement group. Use case: application that maximize high availability and critical applications.
- Partition: each partition represents a rack in AWS infrastructure. Limited to 7 partition per AZ. Partitions can be spread across multipla EZ in the same region. Each partition is phyiscaly isolated from other partition. Use case (big data application): HDFS, HBase, Cassandra and Kafka.

## Elastic Network Interfaces
Represents a virtual network card or a network interface. This is attached to one instance and gives it access to the network.
Each ENI contains:
- Public IPv4
- Private IPv4 (auto or custom) and their DNS 
