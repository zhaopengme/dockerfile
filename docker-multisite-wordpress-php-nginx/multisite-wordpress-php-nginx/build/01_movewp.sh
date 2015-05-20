#!/bin/sh
if [ ! -f /var/www/index.php ]; then
    echo "=> move wordpress from  /apps to /var/www"
    cp -r /apps/wordpress/* /var/www
fi