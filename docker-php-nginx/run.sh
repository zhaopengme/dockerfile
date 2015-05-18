#!/bin/sh
docker run -d -p 80:80 -v C:/Users/zhaopeng/Code/Php/test:/var/www -v /apps/dockerfile/docker-php-nginx-wordpress/nginx:/etc/nginx/sites-available zhaopengme/php-nginx-wordpress:0.1
