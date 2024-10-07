FROM ubuntu:16.04

# 定义 ZMAP_COMMIT 变量，默认为 master
ARG ZMAP_COMMIT=master
ENV ZMAP_COMMIT ${ZMAP_COMMIT}

# 更新并安装必要的构建依赖
RUN apt-get -qq update && apt-get -qqy upgrade && \
    apt-get -qqy install build-essential cmake libgmp3-dev gengetopt libpcap-dev \
    flex byacc libjson-c-dev pkg-config libunistring-dev wget unzip && \
    apt-get -qqy install python3-dev python3-pip && \
    pip3 install dumb-init

# 将当前目录下的所有文件复制到容器的 /root 目录
COPY . /root
