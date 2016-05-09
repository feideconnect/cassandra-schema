#!/bin/sh
/wait-for-it.sh -h ${CASSANDRA_NODE} -p 9042
/go/InitKeyspace
exec /go/bin/migrate -url cassandra://${CASSANDRA_NODE}:9042/${CASSANDRA_KEYSPACE} -path /migrations $@
