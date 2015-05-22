# docker-php-nginx
依赖 docker-baseimage,约定采用数据容器的方式,挂载目录 `/var/www`, `/etc/nginx/sites-available`, `/etc/nginx/sites-enabled`

## 使用

### step 1
编译数据容器

    docker build -t zhaopengme/php-nginx-data ./php-nginx-data

### step 2
编译 php-nginx 容器
    
    docker build -t zhaopengme/php-nginx ./php-nginx


### step 3
运行数据容器

1. 将数据挂载到主机.

        docker run \
            -v `pwd`/data/var/www:/var/www \
            --name php-nginx-data-container  \
            zhaopengme/php-nginx-data \
            echo "php-nginx data container"

2. 将数据挂载到数据容器.

        docker run \
            --name php-nginx-data-container  \
            zhaopengme/php-nginx-data \
            echo "php-nginx data container"

### step 4
运行 nginx 容器

1. 不使用数据容器

        docker run  \
            -d -p 802:80  \
            --name php-nginx   \
            zhaopengme/php-nginx
            
2. 使用数据容器

        docker run  \
            -d -p 80:80  \
            --name php-nginx   \
            --volumes-from php-nginx-data-container \
            zhaopengme/php-nginx

