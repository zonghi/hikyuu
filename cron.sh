docker stop $(docker ps -a | grep hikyuu | awk '{print $1}')
cd /home/sion/docker/hikyuu && /home/sion/docker/hikyuu/CMD/importdata.sh && \
sh CMD/lab.sh &
