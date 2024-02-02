docker stop $(docker ps -a | grep hikyuu | awk '{print $1}')
cd /home/sion/docker/hikyuu
sh CMD/server.sh
