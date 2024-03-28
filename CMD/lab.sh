#!/bin/bash
pt=8888

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
