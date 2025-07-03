
# ElastiCache

ElastiCache is a fully managed, in-memory caching solution.
Support for two open-source, in-memory cache engines: Redis and Memcached
You can build data-intensive apps or improve the performance of your existing apps by retrieving data from high throughput and low latency in-memory data stores.

You can use Amazon ElastiCache to support data-intensive apps or improve the performance of your existing apps by retrieving data from high throughput and low latency in-memory data stores. 

ElastiCache is a popular choice for gaming, advertising technology (ad tech), financial service, healthcare, and Internet of Things (IoT) apps.

No longer need to perform management tasks such as hardware provisioning, software patching, setup, configuration, and failure recovery


Multiple user accessing to the same content at the same time. Cache is a repository of frequently accessed content. without in-memmory database, each request is sent directly to the database in the backend. This can overload the databse.

Redis: support complex data types, data replication and HA
memcahed: data relativly small and static.


Pricing:
- nodes: on demand and reserved (1-3y)
- no elasticcache charges for datatransfer