FROM nextcloud:fpm-alpine

RUN apk add --no-cache --virtual .build-deps \
        libxml2-dev \
        shadow \
        autoconf \
        g++ \
        make \
    && apk add --no-cache imagemagick-dev imagemagick \
    && pecl install imagick-beta \
    && apk del .build-deps

# RUN apk add --update --no-cache autoconf g++ imagemagick imagemagick-dev libtool make pcre-dev \
#     && pecl install imagick \
#     && docker-php-ext-enable imagick \
#     && apk del autoconf g++ libtool make pcre-dev
