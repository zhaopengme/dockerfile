#!/bin/sh
if [ ! -f /var/www/index.php ]; then
    echo "=> move wordpress from  /build to /var/www"
    cp -R /build/wordpress/* /var/www/
fi