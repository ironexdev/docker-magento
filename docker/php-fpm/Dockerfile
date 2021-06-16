FROM php:7.4.19-fpm-alpine

COPY ./docker/php-fpm/php.ini /usr/local/etc/php/php.ini

# php gd dependencies
RUN apk add zlib-dev
RUN apk add jpeg-dev
RUN apk add libpng-dev

# php intl dependencies
RUN apk add icu-dev

# php soap dependencies
RUN apk add libxml2-dev

# php xsl dependencies
RUN apk add libxslt-dev

# php zip dependencies
RUN apk add libzip-dev

RUN docker-php-ext-install mysqli
RUN docker-php-ext-install pdo_mysql
RUN docker-php-ext-install bcmath
RUN docker-php-ext-configure gd --with-jpeg
RUN docker-php-ext-install gd
RUN docker-php-ext-install intl
RUN docker-php-ext-install soap
RUN docker-php-ext-install xsl
RUN docker-php-ext-install zip
RUN docker-php-ext-install sockets

# xdebug
RUN apk add --no-cache $PHPIZE_DEPS \
    && pecl install xdebug-3.0.4 \
    && docker-php-ext-enable xdebug

EXPOSE 9000
