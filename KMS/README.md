
# AWS KMS (Key Management Service)

- Manages encryption keys
- Audit KMS usage using CLoudTrail
- Can be used through Console, SDK and CLI

KMS key types:
- Symmetric (AES-256 keys): single key for encrypt/decrypt
- Asymmetric (RSA & ECC key pairs): Public key (encrypt) and Private key (decrypt). User can´t call the KMS API

Types of KMS Keys:
- AWS Owned keys (free): SSE-S3, SSE-SQS, SSQ-DDB
- AWS Managed key (free)
- Customer Managed keys created in KMS

Billing:
- Pay for API call to KMS

Features: 
- Automatic key rotation
- KMS Key Policies: Control access to KMS keys
- Multi-Region keys: key is replicated in other regions. Keep the same key ID, key material and automatic rotation. They are not global, is a primary key with their replicas. Use case: 
        - Multi-region keys with Global DynamoDB Tables using Client-side encryption, reduces the latency of KMS API calls. 
        - Client-side encryption, Global Aurora and Multi-region KMS keys

Cases:
- Encrypted AMI sharing process: AMI in account 1 is encrypted by KMS Key of account 1. You give permission to the account 2 to launch the Encrypted AMI. Then share the KMS key used to encrypt. In the account 2 the IAM role must have permission to use the KMS key. Finally, Lanuch in the account 2 the AMI and optionally use other key in this account. 
