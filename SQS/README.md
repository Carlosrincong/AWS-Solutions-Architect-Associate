
# AMAZON SQS

Producer -> Queue -> Consumer (EC2, Lambda, server)

Types:
- Standard

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
- Encryption in-flight, at-rest and client-side
- IAM
- SQS Access Policies