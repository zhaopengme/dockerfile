FROM zhaopengme/php-nginx:latest
MAINTAINER mikey.zhaopeng <user.zhaopeng@gmail.com>

ENV HOME /root

ADD ./build/01_movewp.sh /etc/my_init.d/01_movewp.sh
ADD ./build/02_movenginx.sh /etc/my_init.d/02_movenginx.sh

RUN rm -rf /build
RUN mkdir -p /build/nginx
ADD ./build/nginx/ /build/nginx/
RUN curl -sL https://cn.wordpress.org/wordpress-4.2.2-zh_CN.tar.gz | tar xzC /build
ADD ./build/wp-config.php /build/wordpress/wp-config.php

WORKDIR /var/www

EXPOSE 80
# End Nginx-PHP

RUN apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*
