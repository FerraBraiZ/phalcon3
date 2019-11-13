FROM phpdockerio/php73-fpm:latest


# Fix debconf warnings upon build
ARG DEBIAN_FRONTEND=noninteractive

# Install selected extensions and other stuff
RUN apt-get update -yy
RUN apt-get upgrade -yy

# system dependencies
RUN apt-get install --no-install-recommends -yy autoconf
RUN apt-get install --no-install-recommends -yy build-essential
RUN apt-get install --no-install-recommends -yy curl
RUN apt-get install --no-install-recommends -yy gcc
RUN apt-get install --no-install-recommends -yy iproute2
RUN apt-get install --no-install-recommends -yy libbz2-dev
RUN apt-get install --no-install-recommends -yy libc-client-dev
RUN apt-get install --no-install-recommends -yy libc-dev
RUN apt-get install --no-install-recommends -yy libcurl4-gnutls-dev
RUN apt-get install --no-install-recommends -yy libfontconfig1
RUN apt-get install --no-install-recommends -yy libfreetype6-dev
RUN apt-get install --no-install-recommends -yy libicu-dev
RUN apt-get install --no-install-recommends -yy libkrb5-dev
RUN apt-get install --no-install-recommends -yy libmcrypt-dev
RUN apt-get install --no-install-recommends -yy libmemcached-dev
RUN apt-get install --no-install-recommends -yy libmemcached11
RUN apt-get install --no-install-recommends -yy libpcre3-dev
RUN apt-get install --no-install-recommends -yy libpng-dev
RUN apt-get install --no-install-recommends -yy libpq-dev
RUN apt-get install --no-install-recommends -yy libssl-dev
RUN apt-get install --no-install-recommends -yy libssl-dev
RUN apt-get install --no-install-recommends -yy libxml2-dev
RUN apt-get install --no-install-recommends -yy libxrender1
RUN apt-get install --no-install-recommends -yy make
RUN apt-get install --no-install-recommends -yy musl-dev
RUN apt-get install --no-install-recommends -yy net-tools
RUN apt-get install --no-install-recommends -yy openssh-server
RUN apt-get install --no-install-recommends -yy openssl
RUN apt-get install --no-install-recommends -yy pkg-config
#RUN apt-get install --no-install-recommends -yy python-software-properties
RUN apt-get install --no-install-recommends -yy python
RUN apt-get install --no-install-recommends -yy ruby
RUN apt-get install --no-install-recommends -yy ruby-compass
RUN apt-get install --no-install-recommends -yy software-properties-common
RUN apt-get install --no-install-recommends -yy wget
RUN apt-get install --no-install-recommends -yy zlib1g-dev
RUN apt-get install --no-install-recommends -yy vim
RUN apt-get install --no-install-recommends -yy gnupg
RUN apt-get install --no-install-recommends -yy dirmngr
RUN apt-get install --no-install-recommends -yy pwgen
RUN apt-get install --no-install-recommends -yy perl

# php 7.x and it's dependencies
RUN apt-get install --no-install-recommends -yy php7.3
RUN apt-get install --no-install-recommends -yy php7.3-bcmath
RUN apt-get install --no-install-recommends -yy php7.3-cli
RUN apt-get install --no-install-recommends -yy php7.3-common
RUN apt-get install --no-install-recommends -yy php7.3-curl
RUN apt-get install --no-install-recommends -yy php7.3-dev
RUN apt-get install --no-install-recommends -yy php7.3-fileinfo
RUN apt-get install --no-install-recommends -yy php7.3-fpm
RUN apt-get install --no-install-recommends -yy php7.3-gd
RUN apt-get install --no-install-recommends -yy php7.3-gettext
RUN apt-get install --no-install-recommends -yy php7.3-imagick
RUN apt-get install --no-install-recommends -yy php7.3-imap
RUN apt-get install --no-install-recommends -yy php7.3-intl
RUN apt-get install --no-install-recommends -yy php7.3-json
RUN apt-get install --no-install-recommends -yy php7.3-mbstring
#RUN apt-get install --no-install-recommends -yy php7.3-mcrypt # decrapted
RUN apt-get install --no-install-recommends -yy php7.3-mysql
RUN apt-get install --no-install-recommends -yy php7.3-odbc
RUN apt-get install --no-install-recommends -yy php7.3-opcache
RUN apt-get install --no-install-recommends -yy php7.3-pdo
RUN apt-get install --no-install-recommends -yy php7.3-pgsql
RUN apt-get install --no-install-recommends -yy php7.3-readline
RUN apt-get install --no-install-recommends -yy php7.3-soap
RUN apt-get install --no-install-recommends -yy php7.3-sqlite3
RUN apt-get install --no-install-recommends -yy php7.3-tidy
RUN apt-get install --no-install-recommends -yy php7.3-xml
RUN apt-get install --no-install-recommends -yy php7.3-xmlrpc
RUN apt-get install --no-install-recommends -yy php7.3-xsl
RUN apt-get install --no-install-recommends -yy php7.3-zip
RUN apt-get install --no-install-recommends -yy php-imagick
RUN apt-get install --no-install-recommends -yy php-pear
RUN apt-get install --no-install-recommends -yy php-redis
RUN apt-get install --no-install-recommends -yy php-ssh2
RUN apt-get install --no-install-recommends -yy php-xdebug
RUN apt-get install --no-install-recommends -yy php-yaml
RUN apt-get install --no-install-recommends -yy composer

# Download and install phalcon php
RUN curl -s https://packagecloud.io/install/repositories/phalcon/stable/script.deb.sh | bash
RUN apt-get install -yy  php7.3-phalcon

RUN pecl install -f xdebug
RUN pecl install -f mcrypt-1.0.1

RUN pecl install -o -f redis
RUN rm -rf /tmp/pear \
RUN echo "extension=redis.so" > /etc/php/7.3/fpm/conf.d/redis.ini

RUN echo "[Xdebug]\n" \
          "xdebug.remote_enable=1\n" \
          "xdebug.remote_port=9010\n" \
          "xdebug.remote_autostart=1\n" \
          "xdebug.idekey=PHPSTORM_XDEBUG\n" \
          "xdebug.max_nesting_level=1000\n" \
          "xdebug.remote_host="`/sbin/ip route list match 0/0 |awk '{ print $3 }'` > /etc/php/7.3/fpm/conf.d/xdebug.ini

RUN apt-get autoremove
RUN apt-get clean
RUN rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/* /usr/share/doc/*

EXPOSE 9000
WORKDIR /phalcon3