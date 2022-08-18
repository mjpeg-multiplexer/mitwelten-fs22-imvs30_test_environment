#!/bin/bash
echo "panel, 4 Streams 81-84, motion"
echo "Starting multiplexer on port 8088"
echo 
./multiplexer panel input :8080,:8081,:8082,:8083,:8084 output 8088 --activity --log_fps --debug --show_label
