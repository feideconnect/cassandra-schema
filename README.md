# Cassandra schemas for dataporten

Uses https://github.com/mattes/migrate to manage database schema changes for cassandra backend for dataporten. Requires docker to be installed.

## Usage:

Update a database to most recent schema:

```
CASSANDRA_NODE=vltrd006.cassandra.db.uninett.no CASSANDRA_KEYSPACE=dataporten ./migrate up
```

Add a new migration:

```
CASSANDRA_NODE=vltrd006.cassandra.db.uninett.no CASSANDRA_KEYSPACE=dataporten ./migrate create update_for_new_feature
```
