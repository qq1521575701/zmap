安装

    git clone https://github.com/qq1521575701/zmap.git && cd zmap && docker build -t zmap . && cd .. && rm -rf zmap

    docker run -it --name zmap --net host zmap

使用

    nohup zmap -p 80 0.0.0.0/0 -S ip -s port -B 100Mbps > log.log &


卸载

    docker stop zmap && docker rm zmap && docker rmi zmap
