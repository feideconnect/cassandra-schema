package main

import (
	"log"
	"os"

	"github.com/gocql/gocql"
)

func main() {
	node := os.Getenv("CASSANDRA_NODE")
	keyspace := os.Getenv("CASSANDRA_KEYSPACE")
	username := os.Getenv("USERNAME");
	password := os.Getenv("PASSWORD");
	capath := os.Getenv("CAPATH");
	// connect to the cluster
	cluster := gocql.NewCluster(node)
	cluster.Keyspace = "system"
	if len(capath) > 0 {
		cluster.SslOpts = &gocql.SslOptions{CaPath: capath}
	}
	if len(username) > 0 && len(password) > 0 {
		cluster.Authenticator = gocql.PasswordAuthenticator{
			Username: username,
			Password: password,
		}
	}

	session, err := cluster.CreateSession()
	if err != nil {
		log.Fatal(err)
		return
	}
	defer session.Close()

	// create keyspace if needed
	if err := session.Query("CREATE KEYSPACE IF NOT EXISTS " + keyspace + " WITH replication = {'class': 'SimpleStrategy', 'replication_factor': 1}").Exec(); err != nil {
		log.Fatal(err)
	}

}
