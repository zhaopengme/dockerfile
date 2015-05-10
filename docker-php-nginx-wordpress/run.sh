#!/bin/sh
docker run -d -p 9001:80 -v /apps/domains/nideyangzi.com:/var/www -v /apps/dockerfile/docker-php-nginx-wordpress/nginx:/etc/nginx/sites-available zhaopengme/php-nginx-wordpress:0.1
