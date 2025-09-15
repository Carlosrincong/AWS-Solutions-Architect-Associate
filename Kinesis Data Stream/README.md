
# Kinesis

Collect and store streaming data in real-time

- Retention period (up to 365 days)
- Data cant be deleted from kinesis (until it expires)
- Data with the same partition ID is ordered
- Encryption at-rest (KMS) and in-flight (HTTPS)
- Provisioned and on-demand mode
- Producers: Kinesis Agent, AWS SDK or Kinesis Producer Library (KPL) 
- Consumers: Kinesis Data analytics, Kinesis Data Firehose, Lambda or Kinesis Client Library (KCL)