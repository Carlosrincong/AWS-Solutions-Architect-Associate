
# Glue

ETL service for analytics
Serveless

Core components:
- Glue job bookmarks: prevent re-processing old data
- Glue DataBrew: Clean and normalize data using pre-buitl transformation
- Glue Studio: GUI to create, run and monitor ELT jobs in Glue
- Glue Streaming ETL


### Glue Data Catalog

Catalog of dataset
Connect a Glue Data Crawler to source (RDS, S3, DynamoDB), then will write all metadata into Glue Data Catalog. 
This metadata can be laveraged by Glue Jobs to perform ETL

