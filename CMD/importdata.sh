#!/bin/bash
pt=8888

mkdir -p $(pwd)/data

docker run \
       -p $pt:$pt \
       --name="hikyuu" \
       -v $(pwd)/conf:/root/.hikyuu \
       -v $(pwd)/data:/root/data \
       -it hikyuu \
       python3 hikyuu/gui/importdata.py

# echo .............................. Bye
