FROM php:7.4.19-fpm-alpine

ARG DOCKER_IMAGE_FOLDER
ARG GROUP_ID
ARG USER_ID

# iconv fix (https://github.com/docker-library/php/issues/240#issuecomment-763112749)
RUN apk add --upgrade gnu-libiconv
ENV LD_PRELOAD /usr/lib/preloadable_libiconv.so

# php gd dependencies
RUN apk add zlib-dev
RUN apk add jpeg-dev
RUN apk add libpng-dev
RUN apk add freetype-dev

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
RUN docker-php-ext-configure gd --with-freetype --with-jpeg
RUN docker-php-ext-install gd
RUN docker-php-ext-install intl
RUN docker-php-ext-install soap
RUN docker-php-ext-install xsl
RUN docker-php-ext-install zip
RUN docker-php-ext-install sockets

# Xdebug
RUN apk add --no-cache $PHPIZE_DEPS \
    && pecl install xdebug-3.0.4 \
    && docker-php-ext-enable xdebug

COPY --chown $DOCKER_IMAGE_FOLDER/php-fpm/php.ini /usr/local/etc/php/php.ini

# Git
RUN apk add git

# Composer
RUN apk add composer

RUN addgroup -g $GROUP_ID -S dockeruser

RUN adduser -S -G dockeruser -u $USER_ID -s /bin/ash dockeruser

USER dockeruser

RUN chwon dockeruser /usr/local/etc/php/php.ini

WORKDIR /home/dockeruser/magento

EXPOSE 9000
