FROM php:5.6.32-fpm-jessie


RUN apt-get update && \
    apt-get install -y --no-install-recommends \
        curl \
        libmemcached-dev \
        libz-dev \
        libpq-dev \
        libjpeg-dev \
        libpng12-dev \
        libfreetype6-dev \
        libssl-dev \
        libmcrypt-dev \
        libmcrypt4 \
        libcurl3-dev \
        libjpeg62-turbo \
        && rm -rf /var/lib/apt/lists/* \
        && apt-get purge -y --auto-remove

RUN docker-php-ext-install mcrypt

RUN docker-php-ext-install mbstring

RUN docker-php-ext-install mysqli \
    && docker-php-ext-install pdo_mysql

RUN docker-php-ext-install pdo_pgsql

RUN docker-php-ext-install gd && \
    docker-php-ext-configure gd \
        --enable-gd-native-ttf \
        --with-jpeg-dir=/usr/lib \
        --with-freetype-dir=/usr/include/freetype2 && \
    docker-php-ext-install gd