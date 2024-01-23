FROM php:7.2-fpm-alpine
# ARG USER_ID
# ARG GROUP_ID
ARG PHP_XDEBUG_INSTALL="false"
COPY conf/extra-php.ini /usr/local/etc/php/conf.d/extra-php.ini
COPY conf/xdebug.ini /usr/local/etc/php/conf.d/xdebug.ini
RUN apk --update add git gcc g++ make autoconf zlib-dev libmemcached-dev curl \
                musl-dev linux-headers openssl-dev ca-certificates libzip-dev \
                gmp-dev libuuid util-linux-dev sqlite-dev libpng-dev libjpeg-turbo-dev \
                libmcrypt-dev libxslt-dev freetype-dev icu-dev libmemcached-dev shadow tzdata vim && \
                cp /usr/share/zoneinfo/Asia/Shanghai /etc/localtime && \
                echo "Asia/Shanghai" > /etc/timezone
RUN pecl channel-update pecl.php.net && pecl install uuid redis memcached apcu timecop-beta
RUN docker-php-ext-enable uuid redis memcached apcu
RUN docker-php-ext-install gmp iconv pdo_mysql pdo_sqlite mysqli gd exif intl xsl json soap dom zip opcache bcmath
RUN if [ "${PHP_XDEBUG_INSTALL}" = "true" ]; then pecl install xdebug && docker-php-ext-enable xdebug ;fi
RUN if [ ! "${PHP_XDEBUG_INSTALL}" = "true" ]; then rm -rf /usr/local/etc/php/conf.d/xdebug.ini ;fi
RUN docker-php-source delete
ENV COMPOSER_ALLOW_SUPERUSER 1
ENV COMPOSER_NO_INTERACTION 1
RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer
WORKDIR /var/www
# RUN usermod -u ${USER_ID:-1000} www-data && groupmod -g ${GROUP_ID:-1000} www-data
