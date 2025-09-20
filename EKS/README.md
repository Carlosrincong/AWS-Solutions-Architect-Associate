https://aws.amazon.com/eks/

# Amazon Elastic Kubernetes Service (Amazon EKS)

Kubernetes is a portable, extensible, open-source platform for managing containerized workloads and services.

If you already use Kubernetes, you can use Amazon EKS to orchestrate the workloads in the AWS Cloud.

Node types:
- Managed nodes: Create and manage nodes (on-demand or spot instances in a ASG) for you
- Self-managed nodes: More customization and control, you create nodes and register in EKS Cluster. You can use prebuilt AMI. Suports on-demand and spot instances.
- Fargate: Serveless with AWS Fargate

Data volumes:
- EBS
- EFS (works with Fargate)
- FSx for lustre
- FSx for NetApp ONTAP