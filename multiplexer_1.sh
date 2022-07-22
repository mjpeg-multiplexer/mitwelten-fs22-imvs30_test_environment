#!/bin/bash
echo "grid 2x2, 4 Streams 80-83, label, --width 1000 --height 1000"
echo "Starting multiplexer on port 8088"
echo 
./multiplexer grid input :8080,:8081,:8082,:8083 output 8088 --grid_dimension 2,2 --width 1000 --height 1000 --show_label --log_fps
