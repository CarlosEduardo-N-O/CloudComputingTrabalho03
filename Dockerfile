FROM ubuntu:24.04

ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update && \
    apt-get install -y \
    sudo \
    curl \
    wget \
    vim \
    net-tools \
    procps \
    gnupg \
    lsb-release

WORKDIR /app

COPY . /app

RUN chmod +x /app/scripts/*.sh

CMD ["/bin/bash"]