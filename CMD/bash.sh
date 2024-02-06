#!/bin/bash

# 执行env.sh脚本
source $(dirname "$0")/env.sh

docker run \
       -p $hky_pt:$hky_pt \
       --name="hikyuu" \
       --rm \
       -v $(pwd)/conf:/root/.hikyuu \
       -v $(pwd)/data:/root/data \
       -v $trade_path:/trade \
       -it hikyuu \
       bash

# echo .............................. Bye
