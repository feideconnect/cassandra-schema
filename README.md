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

## Docker image:

The docker image can also be pulled from `registry.uninett.no/public/dataporten-cassandra-schemas`

## To work with simplesamlphp session keyspace:

```
SCHEMA=simplesamlphp-session CASSANDRA_NODE=vltrd006.cassandra.db.uninett.no CASSANDRA_KEYSPACE=simplesamlsessions ./migrate up
```

## To work with peoplesearch cache keyspace:

```
SCHEMA=peoplesearch-cache CASSANDRA_NODE=vltrd006.cassandra.db.uninett.no CASSANDRA_KEYSPACE=dp_ps_cache ./migrate up
```

## To work with metadata keyspace:

```
SCHEMA=metadata CASSANDRA_NODE=vltrd006.cassandra.db.uninett.no CASSANDRA_KEYSPACE=metadata ./migrate up
```
