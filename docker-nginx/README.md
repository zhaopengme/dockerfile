# docker-nginx
依赖 docker-baseimage,约定采用数据容器的方式,挂载目录 `/var/www`, `/etc/nginx/sites-available`, `/etc/nginx/sites-enabled`

## 使用

### step 1
编译数据容器

    docker build -t zhaopengme/nginx-data ./nginx-data

### step 2
编译 nginx 容器

    docker build -t zhaopengme/nginx ./nginx

### step 3
运行数据容器

1. 将数据挂载到主机.

        docker run \
            -v `pwd`/data/var/www:/var/www \
            --name nginx-data-container \
            zhaopengme/nginx-data \
            echo "nginx data container"

2. 将数据挂载到数据容器.

        docker run \
            --name nginx-data-container \
            zhaopengme/nginx-data \
            echo "nginx data container"

### step 4
运行 nginx 容器

1. 不使用数据容器

        docker run \
            --name nginx \
            -d -p 80:80 \
            zhaopengme/nginx
            
2. 使用数据容器

        docker run \
            --name nginx \
            --volumes-from nginx-data-container \
            -d -p 80:80 \
            zhaopengme/nginx


## 其他环境变量
`MYSQL_USER` : 设置数据库用户名,默认`admin`  
`MYSQL_PASS` : `MYSQL_USER`的用户密码  
`ON_CREATE_DB`: 初始创建的数据库  

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
