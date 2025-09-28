
# Eñastic MapReduce (EMR)

Create hadoop cluster on AWS to analize and process big data. Apache Spark, Hbase, Presto, Apache Flink
Clusters are made of EC2 instances
Auto-scaling
it´s integrated with Spot instances

Use case:
- Data processing
- Machine Learning
- Big data

Core components:
- Master node: manage the cluster. Long running
- Core node: runs tarks and store data, Long running
- Task node (optional): run tasks. Usually spot

Modes: 
- On-demand: won´t be terminated
- Reserved: min 1 year 
- Spot instances
