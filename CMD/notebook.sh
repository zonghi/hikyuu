#!/bin/bash
pt=8888

mkdir -p $(pwd)/data

docker run \
       -p $pt:$pt \
       --name="hikyuu-notebook" \
       --rm \
       -v $(pwd)/conf:/root/.hikyuu \
       -v $(pwd)/data:/root/data \
       -it hikyuu \
       jupyter notebook --port=8888 --no-browser --ip=0.0.0.0 --allow-root

# echo .............................. Bye
