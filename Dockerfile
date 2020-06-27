FROM php:7-fpm

RUN apt-get update && apt-get install -y

RUN apt-get update && apt-get install -y --no-install-recommends \
        git \
        zlib1g-dev \
        libxml2-dev \
        libzip-dev \
    && docker-php-ext-install \
        zip \
        intl \
        opcache \ 
		mysqli \
        pdo pdo_mysql \
        soap

RUN pecl install xdebug
RUN echo "xdebug.remote_enable=1\n" >> /usr/local/etc/php/conf.d/docker-php-ext-xdebug.ini \
         "xdebug.coverage_enable=1\n" >> /usr/local/etc/php/conf.d/docker-php-ext-xdebug.ini \
         "xdebug.remote_port=9001\n" >> /usr/local/etc/php/conf.d/docker-php-ext-xdebug.ini
RUN docker-php-ext-enable xdebug

RUN curl -sS https://getcomposer.org/installer | php && mv composer.phar /usr/local/bin/composer
COPY symfony/ /var/www/symfony
WORKDIR /var/www/symfony/
