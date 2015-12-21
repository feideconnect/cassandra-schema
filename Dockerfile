FROM golang
RUN go get github.com/mattes/migrate
ADD migrations /migrations
ADD docker-entrypoint.sh /
ENTRYPOINT ["/docker-entrypoint.sh"]
