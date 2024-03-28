#!/bin/bash

# 执行env.sh脚本
#source $(dirname "$0")/env.sh
cd $(dirname "$0")/..
docker run \
       --name="hikyuu-import" \
       --rm \
       -v $(pwd)/conf:/root/.hikyuu \
       -v $(pwd)/data:/root/data \
       -i hikyuu \
       python3 hikyuu/gui/importdata.py

# echo .............................. Bye
