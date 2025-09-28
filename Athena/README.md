
# Athena

Serveless query service to analyze data stored in S3
SQL (built on presto engine)
Supports CSV, JSON, ORC, AVRO and Parquet
Commonly used with Quicksight for reporting/dashboard

### Performance improvement
- Use columnar data for saving costs (less scan). Therefore, the recommended data format is:
    - Parquet
    - ORC
- Compress data for smaller retrievals:
    - bzip2
    - gzip
    - Iz4
    - snappy
    - zstd
- Partition datasets in S3 for easy querying on virtual columns
- Use larger files (> 128 MB)

### Federated Query
Use Data Source Connector taht run on Lambda to run Federated Query. 
Federated Query can query data from any database (DynamoDB, RDS, on-prem, so on) type and return the results to S3