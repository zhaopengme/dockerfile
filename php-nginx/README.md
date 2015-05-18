# php-nginx
Dockerized php &amp; nginx based on phusion/baseimage-docker

php-nginx
============

Docker mysql with data only container approach

Step one (Build the data container):

    docker build -t zhaopengme/docker-php-nginx-data ./docker-php-nginx-data

Step two (Build the mysql container):

    docker build -t zhaopengme/docker-php-nginx ./docker-php-nginx

Step three (Run the data container):
    
    docker run -v /c/Users/Administrator/Code/User/Go/docker/data/nginx-php-data/var/www:/var/www \
               -v /c/Users/Administrator/Code/User/Go/docker/data/nginx-php-data/etc/nginx/sites-available:/etc/nginx/sites-available \
               -v /c/Users/Administrator/Code/User/Go/docker/data/nginx-php-data/etc/nginx/sites-enabled:/etc/nginx/sites-enabled \
     --name php-nginx-data-container zhaopengme/docker-mysql-data echo "nginx-php data container"

Step four (Run the mysql container with data volumes):
    
    docker run -e MYSQL_PASS="12354" -p 3306:3306 -d --name db --volumes-from data-container zhaopengme/docker-mysql

    docker run -d -p 80 --name php-nginx  --volumes-from php-nginx-data-container zhaopengme/docker-php-nginx

# Backups

enter or run a command in the data container as a normal container:

    docker run -it --volumes-from mysql-data busybox /bin/sh

# Databases & users

Add databases and users with pass to ``create_Database_and_users.sh`` on lines:

    DATABASES=("database1" "database2")
    declare -A USERS=(["user1"]="pass1" ["user2"]="pass2")
