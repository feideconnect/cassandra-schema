FROM golang
RUN curl -sS https://vault.uninett.no:8200/v1/dpcassandra/ca/pem > /cassandraca.pem
RUN go get -u -v github.com/feideconnect/migrate
RUN go install -v github.com/feideconnect/migrate
ADD InitKeyspace.go /InitKeyspace.go
RUN go build /InitKeyspace.go
ADD AddTestdata.go /AddTestdata.go
RUN go build /AddTestdata.go
ADD testdata /testdata
ADD wait-for-it.sh /
ADD migrations /migrations
ADD migrations-simplesamlphp-session /migrations-simplesamlphp-session
ADD migrations-peoplesearch-cache /migrations-peoplesearch-cache
ADD migrations-metadata /migrations-metadata
ADD docker-entrypoint.sh /
ENTRYPOINT ["/docker-entrypoint.sh"]
