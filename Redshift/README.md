
# Redshift

Amazon Redshift is an enterprise-level, petabyte scale, fully managed data warehousing service. With Amazon Redshift, you can achieve efficient storage and optimum query performance through a combination of massively parallel processing, columnar data storage, and very efficient, targeted data compression encoding schemes.

A Redshift data warehouse is a collection of computing resources called nodes, which are organized into a group called a cluster

Redshift is based on PostreSQL
massively parallel query execution, and columnar storage on high-performance disk.
Run queries from Datawarehouse or your data lake built on Amazon Simple Storage Service (Amazon S3) with Amazon Redshift Spectrum.

simple and cost-effective to analyze all your data across your data warehouse and data lake (S3)

Analytical data and data watehousing (OLAP), Not used for OLTP
Columnar storage of data and parallel query engine
Concurrency scaling: automaticly adds aditional cluster capacity when is needed for concurrent queries.
Amazon Redshift Scpectrum (optional) to query data stored in S3

Redshift can contain more than one database

Connect to datawarehpuse by using the endpoint URL which contain the host, address and port
SQL Endpoint to connect application to amazon redshift

Pricing:
- Cluster nodes types which includes memmory, storage and I/O
- two modes:
    - On demand
    - Concurrency scaling
- Reserved instance 
- Amazon Redshift Scpectrum

Security:
- IAM
- VPC
- HTTPS connections to secure the data in transit
- Encrypt data at rest

Modes:
- Provisioned cluster
- Serveless cluster

vs Athena:
- Faster queries, joins, aggregations thanks to indexes

Cluster
- Leader node: query planning and result aggregation
- Compute node: perform the queries and send the results to leader

Snapshots and DR
- Optional Muti AZ Cluster for some cluster, By default is single Zone  
- Due to single Zone for disaster recovering use Snapshots.
- Snapshots are incremental
- Automatically (based on certain amount of storage, time or Scheduled) or manually
- Setup Redshift to automatically send a copy of snapshots to another Region

Redshift Spectrum
- Query data that is already in S3 without loading it
- The query is submited to redshift spectrum nodes