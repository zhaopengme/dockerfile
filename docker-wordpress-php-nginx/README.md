# docker-wordpress-php-nginx
依赖 zhaopengme/php-nginx ,约定采用数据容器的方式,挂载目录 `/var/www`, `/etc/nginx/sites-available`, `/etc/nginx/sites-enabled`. 预先将下载的 wordpresss 放置到 `/apps/` 目录下,在运行容器的时候,从 `/apps/` 复制到 `/var/www`, 避免挂载了目录后, 将 `/var/www` 覆盖掉. 


## 使用

### step 1
编译数据容器

    docker build -t zhaopengme/wordpress-php-nginx-data ./wordpress-php-nginx-data

### step 2
编译 php-nginx 容器
    
    docker build -t zhaopengme/wordpress-php-nginx ./wordpress-php-nginx

### step 3
运行数据容器

1. 将数据挂载到主机.

        docker run \
            -v `pwd`/data/var/www:/var/www:rw \
            --name wordpress-php-nginx-data-container  \
            zhaopengme/wordpress-php-nginx-data \
            echo "wordpress-php-nginx data container"

2. 将数据挂载到数据容器.

        docker run \
            --name wordpress-php-nginx-data-container  \
            zhaopengme/wordpress-php-nginx-data \
            echo "wordpress-php-nginx data container"

### step 4
运行 nginx 容器

1. 不使用数据容器

        docker run  \
            -d -p 80:80  \
            --name wordpress-php-nginx   \
            zhaopengme/wordpress-php-nginx
            
2. 使用数据容器

        docker run  \
            -d -p 80:80  \
            --name wordpress-php-nginx   \
            --volumes-from wordpress-php-nginx-data-container \
            zhaopengme/wordpress-php-nginx

