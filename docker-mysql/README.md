# docker-mysql
依赖 docker-baseimage,约定采用数据容器的方式,数据库挂载在 `/var/lib/mysql`.

## mysql 版本
mysql 5.6

## 使用

### step 1
编译数据容器

    docker build -t zhaopengme/mysql-data ./mysql-data
    
### step 2
编译mysql容器

    docker build -t zhaopengme/mysql ./mysql

### step 3
运行数据容器

1. 将数据挂载到主机.

        docker run \  
            -v `pwd`/data/var/lib/mysql:/var/lib/mysql \
            --name mysql-data-container \
            zhaopengme/mysql-data \
            echo "MySQL data container"

2. 将数据挂载到数据容器.

        docker run \
            --name mysql-data-container \
            zhaopengme/mysql-data \
            echo "MySQL data container"

### step 4
运行数据库容器

1. 不使用数据容器

        docker run \
            -e MYSQL_PASS="12354" \
            -d -p 3306:3306  \
            --name mysql \
            zhaopengme/mysql
            
2. 使用数据容器

        docker run \
            -e MYSQL_PASS="12354" \
            -d -p 3306:3306  \
            --name mysql \
            --volumes-from mysql-data-container \
            zhaopengme/mysql

## 其他环境变量
`MYSQL_USER` : 设置数据库用户名,默认`admin`  
`MYSQL_PASS` : `MYSQL_USER`的用户密码  
`ON_CREATE_DB`: 初始创建的数据库  
