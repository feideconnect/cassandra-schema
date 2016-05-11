FROM golang
RUN go get github.com/mattes/migrate
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
ADD docker-entrypoint.sh /
ENTRYPOINT ["/docker-entrypoint.sh"]
