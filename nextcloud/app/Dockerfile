FROM nextcloud:fpm-alpine AS build
RUN apk add bash
COPY . /
RUN /bin/bash /sed-env-replace.sh /usr/local/etc/php-fpm.d/www.conf


FROM nextcloud:fpm-alpine

COPY --from=build /usr/local/etc/php-fpm.d/www.conf /usr/local/etc/php-fpm.d/www.conf

ENV PM.MAX_CHILDREN=5 \
    PM.START_SERVERS=2 \
    PM.MIN_SPARE_SERVERS=1 \
    PM.MAX_SPARE_SERVERS=3 \

RUN apk add --update --no-cache autoconf g++ imagemagick imagemagick-dev libtool make pcre-dev \
    && pecl install imagick \
    && docker-php-ext-enable imagick \
    && apk del autoconf g++ libtool make pcre-dev; exit 0
