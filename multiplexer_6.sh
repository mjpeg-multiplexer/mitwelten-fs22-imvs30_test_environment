#!/bin/bash
echo "carousel --quality 80, --motion, 80-84 --show_label, labels=1,2,3,4,5, label_font_size=8"
echo "Starting multiplexer on port 8088"
echo 
./multiplexer carousel input :8080,:8081,:8082,:8083,:8084 output 8088 --quality 80 --activity --show_label --labels=1,2,3,4,5 --label_font_size=50 --log_fps
