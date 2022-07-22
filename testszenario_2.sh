#!/bin/bash
set -e

sizes=(640x360 1280x720 1920x1080 2560x1440 3840x2160)
delay="60s"

run(){
  cmd=$1
  resize=$2


  if [ -e multiplexer.log ] 
  then
    rm multiplexer.log
  fi

  echo "$cmd"
  echo "----"

  (sleep 1 && timeout $delay curl localhost:8088 &> /dev/null) &
  timeout $delay $cmd || [[ $? -eq 124 ]]

  cat multiplexer.log | grep "FPS" | tail -n +3 | awk -v size="$size" -v n="4" -v resize=$resize '{print n "," size "," $4 "," resize}' >> $file
  rm multiplexer.log
  echo ""
}


file="testszenario_2_results_$(date -d "today" +"%Y_%m_%d_%H-%M").csv"
touch $file

echo "n_streams,size,FPS,resize" >> $file

for size in ${sizes[@]}; do
  ./setup_testszenario_$size.sh

  echo ""
  # ohne
  echo "ohne resize"
  run "./multiplexer grid input localhost:8080,localhost:8081,localhost:8082,localhost:8083 output 8088 --log_fps --quality 80" "0"

  # mit
  echo "mit resize"
  run "./multiplexer grid input localhost:8080,localhost:8081,localhost:8082,localhost:8083 output 8088 --log_fps --quality 80 --width 640" "1"

  ./stop_streams.sh
done

echo "Test successfully finished"
