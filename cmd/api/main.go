package main

import (
	"log"
	"time"
)

func main() {
	for {
		log.Println("Ping is [OK]")
		time.Sleep(1 * time.Second)
	}
}
