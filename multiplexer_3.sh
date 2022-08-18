#!/bin/bash
echo "panel, 3 Streams, 80-82, --cycle --duration 5, --width 1000"
echo "Starting multiplexer on port 8088"
echo 
./multiplexer panel input :8080,:8081,:8082 output 8088 --width 1000 --panel_cycle --duration 5
