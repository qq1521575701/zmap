FROM ubuntu:16.04

# 定义 ZMAP_COMMIT 变量，默认为 master
ARG ZMAP_COMMIT=master
ENV ZMAP_COMMIT ${ZMAP_COMMIT}

# 更新并安装必要的构建依赖
RUN apt-get -qq update && apt-get -qqy upgrade && \
    apt-get -qqy install build-essential cmake libgmp3-dev gengetopt libpcap-dev \
    flex byacc libjson-c-dev pkg-config libunistring-dev wget unzip python3-dev python3-pip && \
    pip3 install --no-cache-dir dumb-init

# 将当前目录下的所有文件复制到容器的 /root 目录
COPY . /root

# 设置工作目录
WORKDIR /root

# 运行 CMake 和 Make
RUN cmake . && make -j4

# 将 ZMap 移动到系统路径
RUN mv /root/src/zmap /usr/local/bin/
