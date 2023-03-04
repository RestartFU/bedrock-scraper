package main

import (
	"log"
	"net"
	"os"
)

var f *os.File

func init() {
	fi, err := os.OpenFile("server_list.txt", os.O_APPEND|os.O_WRONLY, os.ModeAppend)
	if err != nil {
		log.Fatalln(err)
	}
	f = fi
}

func main() {
	l, err := net.Listen("tcp", ":8081")
	if err != nil {
		log.Fatalln(err)
	}
	for {
		conn, err := l.Accept()
		if err != nil {
			return
		}
		go accept(conn)
	}
}

func accept(conn net.Conn) {
	for {
		buf := make([]byte, 1024)
		n, _ := conn.Read(buf)
		buf = buf[:n]
		_, err := f.Write(buf)
		if err != nil {
			log.Fatalln(err)
		}
	}
}
