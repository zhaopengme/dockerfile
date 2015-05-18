# docker-php-nginx
Dockerized php &amp; nginx based on phusion/baseimage-docker


docker-mysql
============

Docker mysql with data only container approach

Step one (Build the data container):

    docker build -t zhaopengme/mysql-data ./mysql-data

Step two (Build the mysql container):

    docker build -t zhaopengme/mysql ./mysql

Step three (Run the data container):
    
    docker run \
    -v /c/Users/Code/User/Go/docker/dockerfile/docker-mysql/data-templdate/var/lib/mysql:/var/lib/mysql \
    --name mysql-data-container \
    zhaopengme/mysql-data \
    echo "MySQL data container"

Step four (Run the mysql container with data volumes):

    docker run \
    -e MYSQL_PASS="12354" \
    -d -p 3306:3306  \
    --name mysql \
    --volumes-from mysql-data-container \
    zhaopengme/mysql

# Backups

enter or run a command in the data container as a normal container:

    docker run -it --volumes-from mysql-data busybox /bin/sh

# Databases & users

Add databases and users with pass to ``create_Database_and_users.sh`` on lines:

    DATABASES=("database1" "database2")
    declare -A USERS=(["user1"]="pass1" ["user2"]="pass2")
