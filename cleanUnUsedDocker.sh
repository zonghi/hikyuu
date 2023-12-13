#!/bin/bash
echo 清理不用的docker磁盘空间
echo cleaing ..............................
echo .............................. 1
docker images
docker stop $(docker ps -a | grep hikyuu | awk '{print $1}')
docker rm -v $(docker ps -a | grep hikyuu | awk '{print $1}')
echo .............................. 2
docker rmi $(docker images  |grep hikyuu| awk '{print $3}')
echo .............................. 3
docker images
echo .............................. clean done
