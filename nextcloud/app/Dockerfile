FROM nextcloud:fpm-alpine AS build
COPY . /
RUN /bin/sh /sed-env-replace.sh /usr/local/etc/php-fpm.d/www.conf


FROM nextcloud:fpm-alpine

COPY --from=build /usr/local/etc/php-fpm.d/www.conf /usr/local/etc/php-fpm.d/www.conf

RUN apk add --update --no-cache autoconf g++ imagemagick imagemagick-dev libtool make pcre-dev \
    && pecl install imagick \
    && docker-php-ext-enable imagick \
    && apk del autoconf g++ libtool make pcre-dev; exit 0
