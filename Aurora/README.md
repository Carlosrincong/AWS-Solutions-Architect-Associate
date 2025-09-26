
## Aurora
Aurora is MySQL and PostgreSQL compatible. 
With Aurora, you can combine the high performance, scalability and availability of traditional enterprise databases with the simplicity and cost-effectiveness of open-source databases.

Scalability, performance, fast failover capabilities, and storage durability
log structured distribuited storage layer

Separation of storage and compute: 
- Storage: automatically mantain 6 copies of datas across 3 AZ (by default), to failover recovery without data loss. Self-healing and auto-scaling
- Compute: Cluster of DB instance across multiple AZ (optional). Auto-scaling of Read replicas. Up to max 50 read replicas
- Custom endpoint: writer enpoint and reader enpoint

point in time recovery

Othet types:
- Aurora serveless: for unpredictable workloads
- Aurora Global databse: up to 16 read instances in each region. Less than 1 second storage replication
- Aurora Machine Learning: ML using SageMaker & Comprehend
- Aurora Database Cloning: new cluster from existing one, this is faster than restoring a snapshot

security:
- encryption at rest and in transit
- private vpc or IGW
- Security groups (database, vpc, ec2)
- IAM 

Pricing
- Host (on-demand, reserved instance or serveless)
- Storage and I/O Consumed
- Data transfer
