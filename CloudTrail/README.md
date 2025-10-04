
# CloudTrail

- Provides compliance, Governance and audit for AWS Accounts
- Enabled by default to all region. Can be set to a single Region
- CloudTrail is in the middle of any action made by: SDK, CLI, Console, IAM users and IAM Roles

Management Events
- By default CloudTrail log management events
- Everything that changes the AWS Account is logged in CloudTrail
- That events can be separated in Read Events (that don´t modify resources) from Write Events (that modify resources)

Data Events:
- By default, Data events are not logged (hight volume of operations)

CloudTrail Insights Events:
- Detect inusual activity in the AWS Account based on write events and their normal management events

Events Retention
- Events are stored 90 days in CloudTrail
- For log term use S3 with Athena
