#!/bin/bash
pt=8888

mkdir -p $(pwd)/data

docker run \
       -p $pt:$pt \
       --name="hikyuu" \
       --rm \
       -v $(pwd)/conf:/root/.hikyuu \
       -v $(pwd)/data:/root/data \
       -it hikyuu \
       bash

# echo .............................. Bye
