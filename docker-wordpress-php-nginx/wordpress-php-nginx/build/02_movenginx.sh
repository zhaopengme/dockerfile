#!/bin/sh
if [ ! -f /etc/nginx/sites-available/global/common.conf ]; then
    echo "=> move nginx config from  /build/nginx to /etc/nginx"
    cp -r /build/nginx/sites-available/* /etc/nginx/sites-available/
    cp /etc/nginx/sites-available/single /etc/nginx/sites-available/default
    nginx -s reload 
fi