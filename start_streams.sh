#!/bin/bash
# creating the folders: ffmpeg -i 8082.mp4 -vf fps=60 ./8082/%4d.jpg
/usr/local/bin/mjpg_streamer -i 'input_file.so  -f ./8080/ --existing -d 0.0333' -o 'output_http.so -w ./www -p 8080' &> /dev/null &
/usr/local/bin/mjpg_streamer -i 'input_file.so  -f ./8081/ --existing -d 0.0500' -o 'output_http.so -w ./www -p 8081' &> /dev/null &
/usr/local/bin/mjpg_streamer -i 'input_file.so  -f ./8082/ --existing -d 0.0166' -o 'output_http.so -w ./www -p 8082' &> /dev/null &
/usr/local/bin/mjpg_streamer -i 'input_file.so  -f ./8083/ --existing -d 0.0333' -o 'output_http.so -w ./www -p 8083' &> /dev/null &
/usr/local/bin/mjpg_streamer -i 'input_file.so  -f ./8084/ --existing -d 0.0333' -o 'output_http.so -w ./www -p 8084' &> /dev/null &

echo "8080: 1920x1080 30fps"
echo "8081: 3840x2160 20fps"
echo "8082: 1920x1080 60fps"
echo "8083: 648x480 30fps"
echo "8084: 720x1280 30fps"
