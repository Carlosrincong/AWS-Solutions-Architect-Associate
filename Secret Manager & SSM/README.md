
# Secret Manager

- Store secrets
- Capability to force rotation of secrets every x days
- Automate generation of secrets on rotation (using lambda as Rotation function)
- Integration with **Amazon RDS**
- Secrets are encrypted using KMS
- Mostly used for Amazon RDS secrets

Multi-region secrets
- Replicate secrets across multiple AWS regions, keeping the primary Secret. 
- You can promote a read replica secret to a Standalone secret

# AWS Systems Manager
### SSM Parameter Store
- Store configurations and secrets with version tracking
- Security with IAM
- Optional encryption with KMS
- Store Hierarchy

Billing
- Standard (free): up to 10.000 parameters per region per Account
- Advanced: up to 100.000 parameters per region per Account. Parameter policy
    - Parameter policy: assign TTL to a parameter. 
