# php-nginx
Dockerized php &amp; nginx based on phusion/baseimage-docker

php-nginx
============

Docker mysql with data only container approach

Step one (Build the data container):

    docker build -t zhaopengme/php-nginx-data ./php-nginx-data

Step two (Build the mysql container):

    docker build -t zhaopengme/php-nginx ./php-nginx

Step three (Run the data container):
    
    docker run \
        -v /c/Users/Code/User/Go/docker/dockerfile/docker-php-nginx/data-templdate/var/www:/var/www:rw \
        --name php-nginx-data-container  \
        zhaopengme/php-nginx-data \
        echo "php-nginx data container"

    docker run \
        --name php-nginx-data-container  \
        zhaopengme/php-nginx-data \
        echo "php-nginx data container"



Step four (Run the mysql container with data volumes):
    
    docker run  \
        -d -p 802:80  \
        --name php-nginx2   \
        --volumes-from php-nginx-data-container \
        zhaopengme/php-nginx

# Backups

enter or run a command in the data container as a normal container:

    docker run -it --volumes-from mysql-data busybox /bin/sh

# Databases & users

Add databases and users with pass to ``create_Database_and_users.sh`` on lines:

    DATABASES=("database1" "database2")
    declare -A USERS=(["user1"]="pass1" ["user2"]="pass2")
