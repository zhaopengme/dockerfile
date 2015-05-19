FROM zhaopengme/php-nginx:latest
MAINTAINER mikey.zhaopeng <user.zhaopeng@gmail.com>

ENV HOME /root

ADD ./build/nginx-site.conf /etc/nginx/sites-available/default
VOLUME ["/var/www"]

RUN rm -rf /var/www/*
ADD https://wordpress.org/latest.tar.gz /wordpress.tar.gz
RUN tar xvzf /wordpress.tar.gz 
RUN mv /wordpress /var/www/
ADD ./build/wp-config.php /var/www/wp-config.php

EXPOSE 80
# End Nginx-PHP
WORKDIR /var/www/

RUN apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*
