FROM nextcloud:fpm-alpine

ENV PM.MAX_CHILDREN=5 \
    PM.START_SERVERS=2 \
    PM.MIN_SPARE_SERVERS=1 \
    PM.MAX_SPARE_SERVERS=3 

RUN apk add --update --no-cache autoconf g++ libtool make pcre-dev ffmpeg nodejs \
    && apk del autoconf g++ libtool make pcre-dev; exit 0
