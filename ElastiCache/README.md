
# ElastiCache

ElastiCache is a fully managed, in-memory caching solution.
No longer need to perform management tasks such as hardware provisioning, software patching, setup, configuration, and failure recovery

Use Case
- You can build data-intensive apps or improve the performance of your existing apps by retrieving data from high throughput and low latency in-memory data stores.
- You can use Amazon ElastiCache to support data-intensive apps or improve the performance of your existing apps by retrieving data from high throughput and low latency in-memory data stores. 
- ElastiCache is a popular choice for gaming, advertising technology (ad tech), financial service, healthcare, and Internet of Things (IoT) apps.
- Multiple user accessing to the same content at the same time. Cache is a repository of frequently accessed content. without in-memmory database, each request is sent directly to the database in the backend. This can overload the databse. In-memmory improve the response time
- Reduce load off of databases for read intensive workloads
- Gaming leaderboards are computationally complex
- Frequent reads, less writes. Cache results fo DB Queries. Store session data for websites.

Note: Using ElastiCache involves heavy application code changes. You query elasticache before the database, this is called "cache hit" in case "Cache miss" the query read from the database while write in the cache the queried data. cache must be ghave an invalidatyion stategy to use only the most current data.
To keep yor application stateless, write the session data into Cache and if the user is redirected to other instance, the applicatien retrieve the session data from cache. 

Support for two open-source, in-memory cache engines:
- Redis: support complex data types, data replication and HA. AOF persistence. Multi AZ with auto-failover. Serveless optional
- memcahed: data relatively small and static. No HA. Serveless

Pricing:
- nodes: on demand and reserved (1-3y)
- no elasticcache charges for datatransfer

Load data to the cache
- lazy loading is reactive (first request) all the read data is cached
- write-through is proactive (when data is inserted into databasealso is written in cache)
- session store: store temporary session data

security
- IAM for API-level security
- VPC and security groups
- connectivity with direct connect or VPN, for on-premise database
- encryption at rest and in transit
- Redis AUTH with pasw/token
- Memcached: SASL-based authentication

Features:
- Support read replicas for Sharding
- Backups
- Snapshots
- Point in time recovery
