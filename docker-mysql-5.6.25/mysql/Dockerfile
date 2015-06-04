FROM zhaopengme/baseimage:latest
MAINTAINER mikey.zhaopeng <user.zhaopeng@gmail.com>

# Default baseimage settings
ENV HOME /root
ENV DEBIAN_FRONTEND noninteractive

# Update software list
RUN apt-get update && \
    apt-get -y install build-essential libncurses5-dev cmake bison g++ 

#添加组          
RUN groupadd mysql 
#创建用户mysql并加入到mysql组，不允许mysql用户直接登录系统
RUN useradd -g mysql mysql -s /bin/false 
#创建MySQL安装目录
RUN mkdir -p /usr/local/mysql5.6 
#创建MySQL数据目录
RUN mkdir -p /usr/local/mysql5.6/data
#设置MySQL数据库目录权限
RUN chown -R mysql:mysql /usr/local/mysql5.6/data

# 下载 MySQL 源码
RUN cd /usr/local/src  
RUN wget -O mysql-5.6.25.tar.gz http://dev.mysql.com/get/Downloads/MySQL-5.6/mysql-5.6.25.tar.gz
RUN tar -zxvf mysql-5.6.25.tar.gz
RUN cd mysql-5.6.25

# 创建MySQL编译
RUN mkdir my-build
RUN cd my-build
RUN cmake ../ -DCMAKE_INSTALL_PREFIX=/usr/local/mysql5.6 -DSYSCONFDIR=/etc -DMYSQL_UNIX_ADDR=/tmp/mysql.sock -DDEFAULT_CHARSET=utf8 -DDEFAULT_COLLATION=utf8_general_ci -DEXTRA_CHARSETS=all -DWITH_MYISAM_STORAGE_ENGINE=1 -DWITH_INNOBASE_STORAGE_ENGINE=1 -DWITH_MEMORY_STORAGE_ENGINE=1 -DWITH_READLINE=1 -DENABLED_LOCAL_INFILE=1 -DMYSQL_DATADIR=/usr/local/mysql5.6/data -DMYSQL_USER=mysql -DWITH_DEBUG=0

#-j 数字 表示以多核心运行
RUN make -j4 
#安装
RUN make install

RUN wget -O mysqld-5.6.25-async12-rhel6-linux64.zip http://www.onexsoft.com/software/mysqld-5.6.25-async12-rhel6-linux64.zip
RUN unzip  mysqld-5.6.25-async12-rhel6-linux64.zip
RUN mv /usr/local/mysql5.6/bin/mysqld /usr/local/mysql5.6/bin/mysqld.bak
RUN mv mysqld /usr/local/mysql5.6/bin/
RUN chmod +x                                                            /usr/local/mysql5.6/bin/


# Configure MySQL
RUN rm -rf                                                              /var/lib/mysql/*
# Remove syslog configuration
RUN mkdir -p                                                            /etc/mysql/conf.d/
RUN rm                                                                  /etc/mysql/conf.d/mysqld_safe_syslog.cnf
# Add MySQL configuration
ADD build/my.cnf                                                        /etc/mysql/conf.d/my.cnf
ADD build/mysqld_charset.cnf                                            /etc/mysql/conf.d/mysqld_charset.cnf

# Add MySQL scripts
RUN mkdir -p                                                            /var/lib/mysql/
RUN chmod -R 755                                                        /var/lib/mysql/
ADD build/import_sql.sh                                                 /import_sql.sh
RUN chmod +x                                                            /import_sql.sh
# Exposed ENV
ENV MYSQL_USER                                                          admin
ENV MYSQL_PASS                                                          **Random**
ENV ON_CREATE_DB                                                        **False**
# Replication ENV
ENV REPLICATION_MASTER                                                  **False**
ENV REPLICATION_SLAVE                                                   **False**
ENV REPLICATION_USER                                                    replica
ENV REPLICATION_PASS                                                    replica

# Add MySQL service
RUN mkdir                                                               /etc/service/mysql
ADD build/run.sh                                                        /etc/service/mysql/run
RUN chmod +x                                                            /etc/service/mysql/run

# Add nginx and MySQL volumes
VOLUME ["/etc/mysql", "/var/lib/mysql"]

EXPOSE 3306
