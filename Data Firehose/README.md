
# Data Firehose
Send data from diferent sources to batch write into a lot of destinations (S3, Redshift, Opensearch, 3rd party)
Buffering acumulates data and finally writes into destinetion as a batch operation
Optionally transform the data using Lambda function or transform the file format into parquet/ORC
Serveless
Near real time