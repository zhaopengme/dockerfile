FROM zhaopengme/php-nginx:latest
MAINTAINER mikey.zhaopeng <user.zhaopeng@gmail.com>

ENV HOME /root

ADD ./build/nginx-site.conf /etc/nginx/sites-available/default
ADD ./build/01_movewp.sh /etc/my_init.d/01_movewp.sh

RUN rm -rf /apps
RUN mkdir -p /apps
RUN curl -sL http://172.30.10.77/wp.tar.gz | tar xzC /apps

ADD ./build/wp-config.php /apps/wordpress/wp-config.php
WORKDIR /var/www

EXPOSE 80
# End Nginx-PHP

RUN apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*
