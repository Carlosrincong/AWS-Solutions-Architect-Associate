
# Amazon SNS (pub/sub)

event producer -> SNS Topic -> subscribers (via Email, SMS or mobile notification, HTTPs, SQS, Lambda, Kinesis)

Event producer:
- CloudWatch alarm
- CloudFormation state changes
- Budget alerts
- Bucket events
- Lambda
- DynamoDB
- RDS events

Security:
- Encryption server-side (in-flight, at-rest) and client-side
- IAM policy
- SNS access policy (who can access you topic)

Feature:
- FIFO topic: order is preserved, the unique subscriber can be SQS 
- SNS + SQS for parallel process (miltriple queue) based on the same message
- Message filtering: JSON policy to filter messages sent to a topic. If a subscription doesnt have a filter, it receives every message