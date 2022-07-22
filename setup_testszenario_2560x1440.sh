#!/bin/bash
file="2560_1440"
/usr/local/bin/mjpg_streamer -i "input_file.so  -f ./benchmark_$file/ --existing -d 0.0166" -o 'output_http.so -w ./www -p 8080' &> /dev/null &
/usr/local/bin/mjpg_streamer -i "input_file.so  -f ./benchmark_$file/ --existing -d 0.0166" -o 'output_http.so -w ./www -p 8081' &> /dev/null &
/usr/local/bin/mjpg_streamer -i "input_file.so  -f ./benchmark_$file/ --existing -d 0.0166" -o 'output_http.so -w ./www -p 8082' &> /dev/null &
/usr/local/bin/mjpg_streamer -i "input_file.so  -f ./benchmark_$file/ --existing -d 0.0166" -o 'output_http.so -w ./www -p 8083' &> /dev/null &

/usr/local/bin/mjpg_streamer -i "input_file.so  -f ./benchmark_$file/ --existing -d 0.0166" -o 'output_http.so -w ./www -p 8084' &> /dev/null &
/usr/local/bin/mjpg_streamer -i "input_file.so  -f ./benchmark_$file/ --existing -d 0.0166" -o 'output_http.so -w ./www -p 8085' &> /dev/null &
/usr/local/bin/mjpg_streamer -i "input_file.so  -f ./benchmark_$file/ --existing -d 0.0166" -o 'output_http.so -w ./www -p 8086' &> /dev/null &
/usr/local/bin/mjpg_streamer -i "input_file.so  -f ./benchmark_$file/ --existing -d 0.0166" -o 'output_http.so -w ./www -p 8087' &> /dev/null &

echo "8080-8087: 2560x1440 60fps"
