# docker-nginx
============

Docker nginx with data only container approach

Step one (Build the data container):

    docker build -t zhaopengme/test-data ./test-data

Step two (Build the nginx container):

    docker build -t zhaopengme/test ./test

Step three (Run the data container):
    
    docker run \
        --name test-data-container \
        zhaopengme/test-data \
        echo "test data container"

Step four (Run the mysql container with data volumes):

    docker run \
        -d -p 80:80  \
        --volumes-from test-data-container \
        zhaopengme/test

# Backups

enter or run a command in the data container as a normal container:

    docker run -it --volumes-from mysql-data busybox /bin/sh

# Databases & users

Add databases and users with pass to ``create_Database_and_users.sh`` on lines:

    DATABASES=("database1" "database2")
    declare -A USERS=(["user1"]="pass1" ["user2"]="pass2")
