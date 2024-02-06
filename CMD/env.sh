#!/bin/bash
export hky_pt=8888

if [[ "$(uname)" == "Darwin" ]]; then
    export trade_path="/Users/lxy/code/trade"
elif [[ "$(uname)" == "Linux" ]]; then
    export trade_path="/home/sion/code/trade"
fi

echo "install env var done!"


