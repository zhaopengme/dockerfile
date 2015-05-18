#!/bin/sh
docker run -d -p 3306:3306 -v /c/Users/zhaopeng/Code/Mysql/etc/mysql:/etc/mysql -v /c/Users/zhaopeng/Code/Mysql/var/lib/mysql:/var/lib/mysql zhaopengme/docker-mysql:0.1
