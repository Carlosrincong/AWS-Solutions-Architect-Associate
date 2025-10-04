
# AWS Organizations

- Global service that allows to Manage multiple AWS Accounts
- The main account is called the management account anbd the others are memeber accounts
- One member account olny can be part of one Organization
- Consolidated billing across all accounts. That means a single payment method
- Billing benefits for aggregated usage
- API for AWS Account creation

Benefits
- Tagging for billing purposes
- Cloud Trail enabled on all account, sending entry logs to a central S3 bucket
- Send CloudWatch logs to a central Logging account
- Cross account roles for admin purposes
- Security Control Policies: Manage IAM policies to accounts. SCP inhertit IAM policy based on hierarchy
- Tag Policy: Standarize tags across all AWS Accounts in an Organization. Define keys and their allowed values. This helps with cost allocation tags and Attributed-based Access Control
 
