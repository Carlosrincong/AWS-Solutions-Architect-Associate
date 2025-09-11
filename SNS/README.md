
# Amazon SNS

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
- SNS access policy