package main

import (
	"fmt"
	"log"
	"os"
	"io/ioutil"
	"github.com/gocql/gocql"
)

func main() {
	node := os.Getenv("CASSANDRA_NODE")
	keyspace := os.Getenv("CASSANDRA_KEYSPACE")
	// connect to the cluster
	cluster := gocql.NewCluster(node)
	cluster.Keyspace = keyspace
	session, _ := cluster.CreateSession()
	defer session.Close()

	tables, _ := ioutil.ReadDir("/testdata")
    for _, f := range tables {
		table := f.Name()
		entries, _ := ioutil.ReadDir("/testdata/" + table)
		for _, f := range entries {
			fmt.Println("/testdata/" + table + "/" + f.Name())
			content, _ := ioutil.ReadFile("/testdata/" + table + "/" + f.Name())
			query := "INSERT INTO " + table + " JSON '" + string(content[:]) + "'"
			fmt.Println("Generated query:")
			fmt.Println(query)
			if err := session.Query(query).Exec(); err != nil {
				log.Fatal(err)
			}

		}
    }
}
