FROM golang
RUN go get github.com/mattes/migrate
RUN go get github.com/gocql/gocql
ADD InitKeyspace.go /InitKeyspace.go
RUN go build /InitKeyspace.go
ADD wait-for-it.sh /
ADD migrations /migrations
ADD docker-entrypoint.sh /
ENTRYPOINT ["/docker-entrypoint.sh"]
