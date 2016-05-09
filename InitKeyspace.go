package main

import (
	"log"
	"os"

	"github.com/gocql/gocql"
)

func main() {
	node := os.Getenv("CASSANDRA_NODE")
	keyspace := os.Getenv("CASSANDRA_KEYSPACE")
	// connect to the cluster
	cluster := gocql.NewCluster(node)
	cluster.Keyspace = "system"
	session, _ := cluster.CreateSession()
	defer session.Close()

	// insert a user
	if err := session.Query("CREATE KEYSPACE IF NOT EXISTS " + keyspace + " WITH replication = {'class': 'SimpleStrategy', 'replication_factor': 1}").Exec(); err != nil {
		log.Fatal(err)
	}

}
