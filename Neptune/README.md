
# Neptune

Neptune is a fully managed graph database offered by AWS.
A graph database is a good choice for highly connected data with a rich variety of relationships.  for applications that work with highly connected datasets. 
Neptune offers by default 3 read replicas in multiple AZ for highly availability (max 15)
Cluster volume: copies of the data in multiple AZ in a single region.

Companies often use graph databases for recommendation engines, fraud detection, and knowledge graphs.

structure, semi structure and un structures data

for highly connected datasets

A knowledge graph allows you to store information in a graph model and use graph queries to enable your users to easily navigate highly connected datasets.

The client application then uses simple SPARQL queries to build graphical visualizations.

optimized for storing billions of relationships and querying the graph with milliseconds latency.

non-relational

identify common data points between nodes.
navigate relationships

ACID Compliancy

Suport: Apache TinkerPop and RDF/SPARQL

Cloud native service storage

nodes (vertices) and links (edges). Nodes are entities and links are how they are connected.

Connect to the database by using an Endpoint (URL: Host/address/ports): 
- Cluster endpoint (primary database)
- Reader endpoint (read replica)
- Instance endpoint (Specific database)

Use case:
- Social networking
- Fraud detection (in transactions)

Pricing:
- Instance Host
- Storage
- Requests to the Database
- Data Transfer out to the database

Security
- IAM: who can manage
- HTTPS encrypted connections: comunication with the database
- Data is encrypted at rest and in transit, keys can be managed with KMS

## Neptune Streams
- Real-time ordered sequence of evenry change to your graph data
- Changes are available inmediately after writing
- Stream data is accesible in a HTTP REST API
- Use Case: notifications, synchronization in another data store, replicate data across multiple regions