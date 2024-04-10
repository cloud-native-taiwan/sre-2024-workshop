FROM ubuntu:22.04
RUN apt-get update && \
    apt-get install -y net-tools \
    tcpdump \
    vim \
    iperf3 \
    iftop \
    ethtool \
    netcat \
    iputils-ping \
    wget \
    curl \
    iproute2 \
    redis-tools \
    dnsutils \
    telnet \
    git \
    stress-ng 

COPY init.sh ./
ENTRYPOINT ["/bin/bash", "./init.sh"]
