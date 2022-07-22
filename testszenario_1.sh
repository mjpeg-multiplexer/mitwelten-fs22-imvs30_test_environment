#!/bin/bash
set -e

sizes=(640x360 1280x720 1920x1080 2560x1440 3840x2160)

delay="60s"

run(){
  cmd=$1
  size=$2
  n=$3

  if [ -e multiplexer.log ] 
  then
    rm multiplexer.log
  fi

  echo "$size:"
  echo "$cmd"
  echo "----"

  (sleep 1 && timeout $delay curl localhost:8088 &> /dev/null) &
  timeout $delay $cmd || [[ $? -eq 124 ]]

  cat multiplexer.log | grep "FPS" | tail -n +3 | awk -v size="$size" -v n="$n" '{print n "," size "," $4}' >> $file
  rm multiplexer.log
  echo ""
}
 
file="testszenario_1_results_$(date -d "today" +"%Y_%m_%d_%H-%M").csv"
touch $file
echo "n_streams,size,FPS" >> $file

for size in ${sizes[@]}; do
  ./setup_testszenario_$size.sh

  echo ""
# 1 stream
  run "./multiplexer grid input localhost:8080 output 8088 --log_fps --quality 80 " $size "1"

  # 2 stream
  run "./multiplexer grid input localhost:8080,localhost:8081 output 8088 --log_fps --quality 80"  $size  "2"

  # 4 stream
  run "./multiplexer grid input localhost:8080,localhost:8081,localhost:8082,localhost:8083 output 8088 --log_fps --quality 80" $size "4"

  # 8 stream
  run "./multiplexer grid input localhost:8080,localhost:8081,localhost:8082,localhost:8083,localhost:8084,localhost:8085,localhost:8086,localhost:8087 output 8088 --log_fps --quality 80" $size "8"

  # 16 stream
  run "./multiplexer grid input localhost:8080,localhost:8081,localhost:8082,localhost:8083,localhost:8084,localhost:8085,localhost:8086,localhost:8087,localhost:8080,localhost:8081,localhost:8082,localhost:8083,localhost:8084,localhost:8085,localhost:8086,localhost:8087 output 8088 --log_fps --quality 80"  $size  "16"

  ./stop_streams.sh
done

echo "Test successfully finished"
