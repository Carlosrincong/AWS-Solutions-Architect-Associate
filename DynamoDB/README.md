https://aws.amazon.com/dynamodb/#

# DynamoDB

DynamoDB is a fully managed NoSQL
tight integration with infrastructure as code (IaC)
OLTP
key-value and document
non-relational database
pricing: storage/read/write
serveless
Scale up or scale down your tables
All your data is stored on SSDs and is automatically replicated across multiple Availability Zones in a Region
Highly available with replication across multiple AZ

Core components: 
- DynamoDB uses primary keys to uniquely identify each item in a table and secondary indexes to provide more querying flexibility.
- Primary key must be decided at the creation time
- Sort key is optional
- 400KB is the maximum size of an Item
- Data types: Scalar types (string, number, binary, boolean and null), Document types (list, map), set types (String set, number set, binary set)
- Case when Schemas need to rapid evolve

![Dynamo_DB_Components_2](/img/Dynamo_DB_Components_2.png)

Use case
- You are experiencing scalability problems with other traditional database systems.
- You are actively engaged in developing an application or service.
- You are working with an OLTP workload.
- You care deploying a mission-critical application that must be highly available at all times without manual intervention.
- You require a high level of data durability, regardless of your backup-and-restore strategy.
- Gamming: with game state, player data, session history, and leaderboards for millions of concurrent users.
- Use design patterns for deploying shopping carts, workflow engines, inventory tracking, and customer profiles. DynamoDB supports high-traffic, extreme-scaled events and can handle millions of queries per second.
- high concurrency and connections for millions of users and millions of requests per second.
- advertising tech, shopping carts, and IoT

Security
- Data is redundantly stored on multiple devices across multiple facilities in a DynamoDB Region.  
- Data is fully encrypted at rest.
- Use IAM to manage access permissions 
- Encryption in transit and at rest

Amazon DynamoDB can handle more than 10 trillion requests per day and support peaks of more than 20 million requests per second. 

mobile, web, gaming, ad tech, IoT

DynamoDB supports ACID-compliant transactions.

Point in time recovery

each table must to have id  and sort key (optional). Local and global index to improve the data access

Billig options:
- Provisioned: read/write expected and scale based on these limits, usefull for predictable use. Pay for provisioned read capacity units (RCU) and write capacity units (WCU), You can optionally autoscale RCU and WCU.
- On demand: storage/read/write, scale troughtput to meet the demand. You pay for what you use, but is more expensive.

- record, attribute and table


You can use Amazon DynamoDB Accelerator (DAX), which is an in-memory store for DynamoDB, without the need to modify application logic.

There is two types of table: 
- Standard
- Infrenquent Access
