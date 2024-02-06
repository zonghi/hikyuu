#!/bin/bash
pt=8888

# 执行env.sh脚本
source $(dirname "$0")/env.sh

docker run \
       -p $pt:$pt \
       --name="hikyuu-notebook" \
       --rm \
       -v $(pwd)/conf:/root/.hikyuu \
       -v $(pwd)/data:/root/data \
       -v $trade_path:/trade \
       -it hikyuu \
       jupyter lab --notebook-dir=/trade \
              --port=8888 \
              --no-browser \
              --ip=0.0.0.0 \
              --allow-root

# echo .............................. Bye
