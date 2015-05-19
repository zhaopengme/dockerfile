# php-nginx
Dockerized php &amp; nginx based on phusion/baseimage-docker

php-nginx
============

Docker mysql with data only container approach

Step one (Build the data container):

    docker build -t zhaopengme/wordpress-php-nginx-data ./wordpress-php-nginx-data

Step two (Build the mysql container):

    docker build -t zhaopengme/wordpress-php-nginx ./wordpress-php-nginx

Step three (Run the data container):
    
    docker run \
        -v /c/Users/Code/User/Go/docker/dockerfile/wordpress-php-nginx/data-templdate/var/www:/var/www:rw \
        --name wordpress-php-nginx-data-container  \
        zhaopengme/wordpress-php-nginx-data \
        echo "wordpress-php-nginx data container"
    docker run \
        --name wordpress-php-nginx-data-container  \
        zhaopengme/wordpress-php-nginx-data \
        echo "wordpress-php-nginx data container"


Step four (Run the mysql container with data volumes):
    
    docker run  \
        -d -p 80:80  \
        --name wordpress-php-nginx   \
        --volumes-from wordpress-php-nginx-data-container \
        zhaopengme/wordpress-php-nginx

# Backups

enter or run a command in the data container as a normal container:

    docker run -it --volumes-from mysql-data busybox /bin/sh

# Databases & users

Add databases and users with pass to ``create_Database_and_users.sh`` on lines:

    DATABASES=("database1" "database2")
    declare -A USERS=(["user1"]="pass1" ["user2"]="pass2")
