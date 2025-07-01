
# Redshift

Amazon Redshift is an enterprise-level, petabyte scale, fully managed data warehousing service. With Amazon Redshift, you can achieve efficient storage and optimum query performance through a combination of massively parallel processing, columnar data storage, and very efficient, targeted data compression encoding schemes.

A Redshift data warehouse is a collection of computing resources called nodes, which are organized into a group called a cluster

massively parallel query execution, and columnar storage on high-performance disk.
Run queries from Datawarehouse or your data lake built on Amazon Simple Storage Service (Amazon S3) with Amazon Redshift Spectrum.

simple and cost-effective to analyze all your data across your data warehouse and data lake (S3)

Analytical data

Concurrency scaling: automaticly adds aditional cluster capacity when is needed for concurrent queries.
Amazon Redshift Scpectrum (optional) to query data stored in S3

Redshift can contain more than one database

Connect to datawarehpuse by using the endpoint URL which contain the host, address and port
SQL Endpoint to connect application to amazon redshift

Pricing:
- Cluster nodes types which includes memmory, storage and I/O
- two modes:
    - On demand
    - Concurrency scalin
- Reserved instance 
- Amazon Redshift Scpectrum

Security:
- IAM
- VPC
- HTTPS connections to secure the data in transit
- Encrypt data at rest
