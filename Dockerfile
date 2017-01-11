FROM golang
RUN curl -sS https://vault.uninett.no:8200/v1/dpcassandra/ca/pem > /cassandraca.pem
RUN go get -d github.com/mattes/migrate
RUN rm -rf /go/src/github.com/mattes/migrate && git clone https://github.com/feideconnect/migrate.git /go/src/github.com/mattes/migrate
RUN go install -v github.com/mattes/migrate
RUN go get github.com/gocql/gocql
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
