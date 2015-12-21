#!/bin/sh
exec /go/bin/migrate -url cassandra://${CASSANDRA_NODE}:9042/${CASSANDRA_KEYSPACE} -path /migrations $@
