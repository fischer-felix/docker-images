FROM nextcloud:fpm-alpine

# RUN apk add --update --no-cache autoconf g++ imagemagick imagemagick-dev libtool make pcre-dev \
#     && pecl install imagick \
#     && docker-php-ext-enable imagick \
#     && apk del autoconf g++ libtool make pcre-dev

ADD https://github.com/mlocati/docker-php-extension-installer/releases/latest/download/install-php-extensions /usr/local/bin/



RUN chmod +x /usr/local/bin/install-php-extensions && \
    install-php-extensions imagick