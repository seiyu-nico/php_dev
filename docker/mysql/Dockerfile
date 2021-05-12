FROM mysql:8.0
LABEL maintainer "seiyu-nico <yuseiishii141+docker@gmail.com>"

RUN apt-get update && \
    apt-get install -y locales locales-all && \
    echo "ja_JP.UTF-8 UTF-8" > /etc/locale.gen && \
    locale-gen ja_JP.UTF-8 && \
    update-locale LANG=ja_JP.UTF-8 && \
    groupmod -g 1000 mysql && usermod -u 1000 -g 1000 mysql && \
    mkdir /var/log/mysql && \
    chown mysql:mysql /var/log/mysql && \
    rm -rf /var/lib/apt/lists/* 

ENV LANG ja_JP.UTF-8
ENV LANGUAGE ja_JP:ja
ENV LC_ALL ja_JP.UTF-8

COPY ./my.cnf /etc/mysql/conf.d/my.cnf
