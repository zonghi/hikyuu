#!/bin/bash

# 执行env.sh脚本
source $(dirname "$0")/env.sh

# docker stop $(docker ps -a | grep hikyuu | awk '{print $1}')

echo .............................. Start alert

docker run \
        --name="hikyuu-alert" \
        --rm \
        -v $(pwd)/conf:/root/.hikyuu \
        -v $(pwd)/data:/root/data \
        -v $trade_path:/trade \
        -d \
        -it hikyuu \
        python3 /trade/docker-alert.py
while true; do
    echo .............................. Start import
    docker run \
           --name="hikyuu-import" \
           --rm \
           -v $(pwd)/conf:/root/.hikyuu \
           -v $(pwd)/data:/root/data \
           -it hikyuu \
           python3 hikyuu/gui/importdata.py

    echo .............................. Start filter
    docker run \
          --name="hikyuu-filter" \
          --rm \
          -v $(pwd)/conf:/root/.hikyuu \
          -v $(pwd)/data:/root/data \
          -v $trade_path:/trade \
          -it hikyuu \
          python3 /trade/docker-server.py
done

# echo .............................. Bye
