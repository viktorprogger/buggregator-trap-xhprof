FROM php:8.3-cli-alpine

RUN apk --no-cache add --virtual .build-deps $PHPIZE_DEPS linux-headers \
    && apk --no-cache add git \
    && docker-php-ext-install -j$(nproc) sockets \
    && pecl install xhprof

COPY --from=composer:latest /usr/bin/composer /usr/bin/composer
COPY xhprof.ini /usr/local/etc/php/conf.d/xhprof.ini

ARG USER_ID=1000
ARG GROUP_ID=1000
RUN addgroup -g $USER_ID appuser && \
    adduser -D -u $GROUP_ID -G appuser appuser

USER appuser
WORKDIR /app
COPY --chown=appuser:appuser . ./
RUN mkdir data && composer install

EXPOSE 8000
CMD vendor/bin/trap --ui
