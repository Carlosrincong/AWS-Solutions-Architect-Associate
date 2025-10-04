
# EventBridge
Event Rule = Source Event + Destination or Target

Source Event
- Schedule cron jobs
- Event pattern: react to a cloud event

Filter events before call EventBridge

Destination
- Compute: Lambda, ECS Task, AWS Batch
- Integration: SNS, SQS, Kinesis Data streams
- Orchestration: Step Function, CodePipeline, CodeBuild

Features:
- Event Bus is a collection of Event rules
- Schemas Registry is the detail of JSON events that you can expect when an event is triggered