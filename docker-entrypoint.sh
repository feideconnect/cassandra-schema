#!/bin/sh
if test "${SCHEMA}" != ""
then
    SUFFIX="-${SCHEMA}"
else
    SUFFIX=""
fi
if test "${USERNAME}" != "" -a "${PASSWORD}" != ""
then
    CREDS="${USERNAME}:${PASSWORD}@"
else
    CREDS=""
fi
if test "${CAPATH}" != ""
then
    PARAMS="?capath=${CAPATH}"
else
    PARAMS=""
fi
/wait-for-it.sh -h ${CASSANDRA_NODE} -p 9042 -t 60
/go/InitKeyspace
/go/bin/migrate -url "cassandra://${CREDS}${CASSANDRA_NODE}:9042/${CASSANDRA_KEYSPACE}${PARAMS}" -path /migrations$SUFFIX $@
if test "${TESTDATA}" != ""
then
    /go/AddTestdata
fi
