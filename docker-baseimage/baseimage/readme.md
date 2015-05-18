# docker-php-nginx
Dockerized php &amp; nginx based on phusion/baseimage-docker


docker-mysql
============

Docker mysql with data only container approach

Step one (Build the baseimage container):

    docker build -t zhaopengme/baseimage ./baseimage

Step two (Run the baseimage container):

    docker run -d zhaopengme/baseimage 

Step three (Run the data container):
    


Step four (Run the mysql container with data volumes):



# Backups

enter or run a command in the data container as a normal container:

    docker run -it --volumes-from mysql-data busybox /bin/sh

# Databases & users

Add databases and users with pass to ``create_Database_and_users.sh`` on lines:

    DATABASES=("database1" "database2")
    declare -A USERS=(["user1"]="pass1" ["user2"]="pass2")
