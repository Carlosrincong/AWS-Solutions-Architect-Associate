
# AWS Backup
- fully managed service
- centrally automate and manage backups across AWS services
- Supported services: EC2, EBS, S3, RDS, DynamoDB, DocumentDB, Neptune, EFS, FSx, Aurora. 
- Supports cross-region backups and cross-accounts backups
- On-demand and shceduled backups
- PITR
- tag-based backup policies
- Backup Plans: backup policies with frecuency, window, retention and cold storage

### AWS Backup Vault Lock 
Enforces WORM (write once, read many) in all backups that are stored in Vault Lock. 
Backups can´t be deleted.

