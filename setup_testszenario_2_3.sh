#!/bin/bash
# creating the folders: ffmpeg -i 8082.mp4 -vf fps=60 ./8082/%4d.jpg
/usr/local/bin/mjpg_streamer -i 'input_file.so  -f ./benchmark_640_360/ --existing -d 0.0166' -o 'output_http.so -w ./www -p 8080' &> /dev/null &
/usr/local/bin/mjpg_streamer -i 'input_file.so  -f ./benchmark_1280_720/ --existing -d 0.0166' -o 'output_http.so -w ./www -p 8081' &> /dev/null &
/usr/local/bin/mjpg_streamer -i 'input_file.so  -f ./benchmark_1920_1080/ --existing -d 0.0166' -o 'output_http.so -w ./www -p 8082' &> /dev/null &
/usr/local/bin/mjpg_streamer -i 'input_file.so  -f ./benchmark_2560_1440/ --existing -d 0.0166' -o 'output_http.so -w ./www -p 8083' &> /dev/null &
/usr/local/bin/mjpg_streamer -i 'input_file.so  -f ./benchmark_3840_2160/ --existing -d 0.0166' -o 'output_http.so -w ./www -p 8084' &> /dev/null &

echo "8080: 640x360 60fps"
echo "8081: 1280x720 60fps"
echo "8082: 1920x1080 60fps"
echo "8083: 2560x1440 60fps"
echo "8084: 3840x2160 60fps"
