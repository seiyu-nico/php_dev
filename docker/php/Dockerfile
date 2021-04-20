FROM php:7.4.12-fpm-alpine3.12 
LABEL maintainer "seiyu-nico <yuseiishii141+docker@gmail.com>"

RUN apk upgrade --update && \
    apk --no-cache --update add icu-dev autoconf make g++ gcc oniguruma-dev bash gmp-dev && \
    docker-php-ext-install  -j$(nproc) iconv intl mbstring pdo_mysql opcache mysqli gmp && \
    pecl install xdebug-2.9.8 && \
    docker-php-ext-enable xdebug && \
    set -eux && \
    apk add --update --no-cache git autoconf g++ libtool make libzip-dev libpng-dev libjpeg-turbo-dev freetype-dev && \
    pecl install redis && \
    docker-php-ext-configure gd --with-jpeg=/usr && \
    docker-php-ext-configure opcache --enable-opcache && \
    docker-php-ext-install opcache bcmath pdo_mysql gd exif zip && \
    docker-php-ext-enable redis && \
    apk del autoconf g++ libtool make && \
    rm -rf /tmp/* && \
    apk upgrade --update && apk --no-cache add icu-dev autoconf make g++ gcc curl && \
    curl -sS https://get.symfony.com/cli/installer | bash && \
    mv /root/.symfony/bin/symfony /usr/local/bin/symfony && \
    apk --update add tzdata && \
    cp /usr/share/zoneinfo/Asia/Tokyo /etc/localtime && \
    apk del tzdata && \
    rm -rf /var/cache/apk/*

COPY --from=composer:2.0 /usr/bin/composer /usr/bin/composer

WORKDIR /var/www
COPY www.conf /usr/local/etc/php-fpm.d/www.conf
COPY php.ini /usr/local/etc/php/php.ini

ENV user tech
ENV group tech
RUN deluser --remove-home www-data && \
    adduser -u 1000 -h /home/${user} --disabled-password ${user} && \
    chown -R ${user}:${group} /home/${user} && \
    chown -R ${user}:${group} /var/www/ && \
    chown -R ${user}:${group} /var/run/ && \
    chown -R ${user}:${group} /var/log/
USER ${user}

