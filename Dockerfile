FROM ubuntu:24.04

ENV DEBIAN_FRONTEND=noninteractive

RUN apt update && apt install -y \
    apache2 \
    tar \
    procps \
    sudo \
    nano

WORKDIR /app

COPY . /app

RUN chmod +x /app/scripts/*.sh

EXPOSE 80

CMD ["apachectl","-D","FOREGROUND"]