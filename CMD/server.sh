#!/bin/bash

docker run \
        --name="hikyuu-server" \
        --rm \
        -v $(pwd)/conf:/root/.hikyuu \
        -v $(pwd)/data:/root/data \
        -v /root/code/trade:/trade \
        -i hikyuu \
        python3 /trade/docker-server.py
echo .............................. Bye
