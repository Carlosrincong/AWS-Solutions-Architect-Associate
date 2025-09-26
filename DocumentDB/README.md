
# DocumentDB

Amazon DocumentDB is a fully managed document NoSQL database from AWS
MongoDB workloads at scale
the storage and compute are decoupled, allowing each to scale independently.
DocumentDB has API compatibility with MongoDB
Amazon DocumentDB is used for storing semistructured data as a document
highly available with replication across 3 AZ
Storage automatically grows in increments of 10GB

With Amazon DocumentDB’s document data model, you can manage profiles and preferences for millions of users and scale to process millions of user requests per second with millisecond latency.
Documents - collections - key/value or nested fields

Use case:
- Content management
- real time operations
- content management systems, profile management, and web and mobile applications.

Pricing:
- Instance host
- Storage
- Backups in other region
- IOPS
- Data transfer out of the database

cluster: instances + volume storage
volume stores 6 copies of the data in 3 AZ
VPC is required.  DocumentDB only run in a VPC

Security
- IAM: users, roles and policies
- TLS to connect to the database
- Encrypt data in transit and at rest
