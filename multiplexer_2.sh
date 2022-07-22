#!/bin/bash
echo "grid 2x3, 5 Streams 80-84, --width 1000 --height 1000, --ignore_aspect_ratio"
echo "Starting multiplexer on port 8088"
echo 
./multiplexer grid input :8080,:8081,:8082,:8083,:8084 output 8088 --grid_dimension 2,3 --width 1000 --height 1000 --ignore_aspect_ratio
