FROM node:14-alpine3.10
LABEL maintainer "seiyu-nico <yuseiishii141+docker@gmail.com>"

ENV user tech
RUN deluser --remove-home node && \
    adduser -u 1000 -h /home/${user} --disabled-password ${user} && \
    chown -R ${user}:${user} /home/${user} && \
    apk --update add tzdata && \
    cp /usr/share/zoneinfo/Asia/Tokyo /etc/localtime && \
    apk del tzdata && \
    rm -rf /var/cache/apk/*

WORKDIR /home/${user}/workspace
ENV NODE_ENV=development
USER ${user}
