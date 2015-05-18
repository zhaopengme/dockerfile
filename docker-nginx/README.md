# docker-nginx
============

Docker nginx with data only container approach

Step one (Build the data container):

    docker build -t zhaopengme/nginx-data ./nginx-data

Step two (Build the nginx container):

    docker build -t zhaopengme/nginx ./nginx

Step three (Run the data container):
    
    docker run \
        -v /c/Users/Code/User/Go/docker/dockerfile/docker-nginx/data-templdate/var/www:/var/www \
        -v /c/Users/Code/User/Go/docker/dockerfile/docker-nginx/data-templdate/etc/nginx/sites-available:/etc/nginx/sites-available \
        -v /c/Users/Code/User/Go/docker/dockerfile/docker-nginx/data-templdate/etc/nginx/sites-enabled:/etc/nginx/sites-enabled \
        --name nginx-data-container \
        zhaopengme/nginx-data \
        echo "nginx data container"

Step four (Run the mysql container with data volumes):

    docker run \
    --name nginx \
    --volumes-from nginx-data-container \
    -d -p 80:80 \
    zhaopengme/nginx

# Backups

enter or run a command in the data container as a normal container:

    docker run -it --volumes-from mysql-data busybox /bin/sh

# Databases & users

Add databases and users with pass to ``create_Database_and_users.sh`` on lines:

    DATABASES=("database1" "database2")
    declare -A USERS=(["user1"]="pass1" ["user2"]="pass2")
