
# Database Migration Service (DMS)

- Homogeneous: ex, oracle to oracle
- Heterogeneous: ex, SQL Server to Aurora -> serveless migration or instance-based migration

instance-based migration: an EC2 instances is required to perform the database replication task
The source database remains available during the migration
migration requires: migration instance + endpoint + Database migration task.

### AWS Schema Conversion Tool
- Convert DB´s schema from one engine to another

