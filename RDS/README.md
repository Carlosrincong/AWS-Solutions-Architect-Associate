https://aws.amazon.com/rds/

# Relational databases

A relational database organizes data into tables. Data in one table can link to data in other tables to create relationships—hence, the relational part of the name.
row is an entry and columns are the attributes of an entry
TheData schema is fixed. After the database is operational, it becomes difficult to change the schema.

RDBMSs:
- MySQL
- PostgresQL
- Oracle
- Microsoft SQL Server
- Amazon Aurora
 
Use Case
they’re at the core of many mission-critical application
- Applications that have a fixed schema
- Applications that need persistent storage and follow the ACID principle: CRM, ERP, financial and commerce.

Unmanaged Vs Manages:
![OnPrem_vs_EC2](/img/OnPrem_vs_EC2.png) 
![Managed_DB](/img/Managed_DB.png)

# Amazon RDS
Amazon RDS is a managed database service
Amazon RDS Multi-AZ: Amazon RDS creates a redundant copy of your database in another Availability Zone. The standby copy is not considered an active database, and it does not get queried by applications. DNS Service to point to the new master instances in case of failover.

Amazon RDS is built from compute and storage:
- Compute (Amazon EC2): The compute portion is called the database (DB) instance, which runs the DB engine.
- Storage (Amazon EBS): Amazon RDS provides three storage types: General Purpose SSD (also called gp2 and gp3), Provisioned IOPS SSD (also called io1), and Magnetic (also called standard)

Supported RDBMSs:
- Commercial: Oracle, SQL Server
- Open source: MySQL, PostgreSQL, MariaDB
- Cloud native: Aurora. With cluster volume for HA and a Local Persistent storage.

Security
- DB instance must be in a private subnet group. So they don’t have a route to the internet gateway. 
- Security can be reinforced with security groups (Database, EC2 and VPC)
- IAM Policy 
- Secure data in transit and at rest.

- Network ACLs

Backup data:
It is advisable to deploy both backup options. Automated backups are beneficial for point-in-time recovery. With manual snapshots, you can retain backups for longer than 35 days.
- Automated backups (by default): set the  backup window during a time when your database experiences little activity because it can cause increased latency and downtime. The benefit of automated backups that you can do point-in-time recovery.
- Manual snapshot: If you want to keep your automated backups longer than 35 days, use manual snapshots. Manual snapshots are similar to taking Amazon EBS snapshots, except you manage them in the Amazon RDS console. 

With Amazon RDS, you can manage common database administration tasks like OS patching, database updates, and backups

Tables should be indexed to allow a query to quickly find the data needed to produce a result. Indexes can also help control the way data is physically stored on disk. They physically group records into a predictable order based on the key values within the table. This plays a huge part in the speed and efficiency of queries.

OLTP: databases focus on recording Update, Insertion, and Deletion data transactions. 
OLAP: you can extract information from a large database and analyze it for decision-making

Use case:
- Transactional data
- Analytical data
- Website backend
- Customer data

Pricing
- Host instance (reserved or on-demand)
- Storage
- Traffic from and to



 read replica, which is asynchronously updated. usefull for read-heavy database workloads beyond the capacity constraints of a single database instance.