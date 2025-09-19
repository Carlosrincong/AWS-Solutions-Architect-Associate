
# AMAZON SQS

Producer -> Queue -> Consumer (EC2, Lambda, server)
Scales automatically

Types:
- Standard: order is not preserved
- FIFI: order is preserved

Set-up
- Retention
- Visibility timeout: once a message is visible to one consumer, the message will be invisible for a time to other consumers. That time is the visibility timeout.
- Delivery delay
- Receive message wait time

Producer:
- Unlimited numer of messages in Queue to unlimited througput
- YOu can duplicate a message
- Messages will live in Queue until a custme deletes it, When the message has been processed.
- Message retention: 4 days (default) and up to 14 days

Consumer:
- Consumer is responsible of consume the messages
- Delete the message to garantee that other consumer 
- Scale Autoscaling group based on the Queue lenght metric of CloudWatch

Security
- Encryption server-side (in-flight, at-rest) and client-side
- IAM
- SQS Access Policies

Feature:
- Purge to delete all messages in a Queue
- Long polling: polling messages for a long time (20 sec max) to decrease the number of API calls to SQS, while there are not messages arriving to the Queue