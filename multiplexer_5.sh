#!/bin/bash
echo "carousel (passthrough) 80-84, --output_fps 20,"
echo "Starting multiplexer on port 8088"
echo 
./multiplexer carousel input :8080,:8081,:8082,:8083,:8084 output 8088 --framerate 20 --log_fps 
