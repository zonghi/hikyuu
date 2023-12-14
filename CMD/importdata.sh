#!/bin/bash

mkdir -p $(pwd)/data

docker run \
       --name="hikyuu-import" \
       --rm \
       -v $(pwd)/conf:/root/.hikyuu \
       -v $(pwd)/data:/root/data \
       -it hikyuu \
       python3 hikyuu/gui/importdata.py

# echo .............................. Bye
