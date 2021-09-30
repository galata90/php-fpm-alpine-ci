FROM php:7.3.13-fpm-alpine3.10

COPY --from=mlocati/php-extension-installer /usr/bin/install-php-extensions /usr/bin/

RUN install-php-extensions gd pdo_mysql mbstring zip pcntl exif sockets intl \
    && mkdir -p /var/www

COPY --from=composer:2.1.8 /usr/bin/composer /usr/bin/composer

WORKDIR /var/www
