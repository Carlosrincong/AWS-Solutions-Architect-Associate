https://aws.amazon.com/ecs/
https://aws.amazon.com/containers/services/

# Container
A container is a standardized unit that packages your code and its dependencies. This package is designed to run reliably on any platform, because the container creates its own independent environment.
There are no time-out limits when running. This is useful for applications that run longer than 15 minutes or that need to initiate instantly when called.

Use case:
- Applications that are compute intensive run better in a container environment. If you have a small application that runs under in 15 minutes but is compute intensive, consider using a container. 
- Large monoliths that have many parts are very suitable applications to consider moving to containers. 
- microservices, using containers to isolate processes.
- With containers, you can package entire applications and move them to the cloud without the need to make any code changes. 
- Dont use When applications need persistent data storage
- Dont use When applications have complex networking, routing, or security requiremen

# Amazon Elastic Container Service (Amazon ECS)

![ecs](/img/ecsconstruct3.png)

Amazon ECS is an end-to-end container orchestration service that helps you spin up new containers. With Amazon ECS, your containers are defined in a task definition that you use to run an individual task or a task within a service. 

To prepare your application to run on Amazon ECS, you create a task definition. The task definition is a text file, in JSON format, that describes one or more containers and the resources that you need to run a container, such as CPU, memory, ports, images, storage, and networking information.

Launch ECS Task (containers) on ECS Clusters (Cloud)

Launch Type
- EC2 Launch Type: You provision and mantain the infrastructure. Each EC2 Instance on Cluster must run an agent to be part of the cluster. AWS start/Stop the containers on cluster. You create the task definition (Docker file)
- Fargate: There is no instance to manage. Its all serveless. You create the task definition. AWS run this Task based on the amount of CPU and RAM you need

IAM Roles for ECS
- ECS instance profile: Used by the ECS agent in the ECnch type to interact with ECS, CloudWatch, ECR, Secret Manager, so on.
- ECS Task Role: Allow ECS Task to have a specific role. Task Role is defined in the Task Definition.

Data Volumes: Data persitence on ECS using EFS, which works with both Launch types. Usefull if you want a file system taht your taks use to share the same data. S3 cant be mounted as File system.

ECS Service auto scaling (tasks)
Increase/Decrease the number of task running on ECS Cluster using
- AWS Application Auto Scaling: CPU, RAM or Metric from ALB. 
- Schedule
- CloudWatch metric or alarm

Auto Scaling EC2 Instances
- Auto Scaling Group: CPU
- ECS Cluster Capacity Provider (recommended)

Use
- S3 + EventBridge to invoke a ECS task to load the s3 file data to DynamoDB
- EventBridge Schedule to trigger ECS Taks every time you choose (day, hour, minute, so on)
- SQS Queue and ECS service polling messages from the queue
- Register Stopped ECS task to Eventbridge, then use this evento to send a notification using SNS. 

Step-by-step
1. Create the ECS cluster with one or two types
2. Create a Service with the node definition and Role, to create nodes in CLuster