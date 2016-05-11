#!/bin/sh
if test "${SCHEMA}" != ""
then
    SUFFIX="-${SCHEMA}"
else
    SUFFIX=""
fi
/wait-for-it.sh -h ${CASSANDRA_NODE} -p 9042
/go/InitKeyspace
/go/bin/migrate -url cassandra://${CASSANDRA_NODE}:9042/${CASSANDRA_KEYSPACE} -path /migrations$SUFFIX $@
if test "${TESTDATA}" != ""
then
    /go/AddTestdata
fi
