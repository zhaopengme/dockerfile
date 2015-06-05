FROM zhaopengme/baseimage:latest
MAINTAINER mikey.zhaopeng <user.zhaopeng@gmail.com>

# Default baseimage settings
ENV HOME /root
ENV DEBIAN_FRONTEND noninteractive

RUN groupadd -r mysql && useradd -r -g mysql mysql

# FATAL ERROR: please install the following Perl modules before executing /usr/local/mysql/scripts/mysql_install_db:
# File::Basename
# File::Copy
# Sys::Hostname
# Data::Dumper
RUN apt-get update && apt-get install -y perl --no-install-recommends pwgen  && rm -rf /var/lib/apt/lists/*

# gpg: key 5072E1F5: public key "MySQL Release Engineering <mysql-build@oss.oracle.com>" imported
RUN apt-key adv --keyserver pool.sks-keyservers.net --recv-keys A4A9406876FCBD3C456770C88C718D3B5072E1F5

ENV MYSQL_MAJOR 5.6
ENV MYSQL_VERSION 5.6.25

RUN echo "deb http://repo.mysql.com/apt/debian/ wheezy mysql-${MYSQL_MAJOR}" > /etc/apt/sources.list.d/mysql.list

# the "/var/lib/mysql" stuff here is because the mysql-server postinst doesn't have an explicit way to disable the mysql_install_db codepath besides having a database already "configured" (ie, stuff in /var/lib/mysql/mysql)
# also, we set debconf keys to make APT a little quieter
RUN apt-get update && apt-get install -y mysql-server="${MYSQL_VERSION}"* && rm -rf /var/lib/apt/lists/* \
	&& rm -rf /var/lib/mysql && mkdir -p /var/lib/mysql


RUN cd / 
RUN wget -O mysqld-5.6.25-async12-rhel6-linux64.zip http://www.onexsoft.com/software/mysqld-5.6.25-async12-rhel6-linux64.zip
RUN unzip  mysqld-5.6.25-async12-rhel6-linux64.zip
RUN mv /usr/sbin/mysqld /usr/sbin/mysqld.bak
RUN mv mysqld /usr/sbin/
RUN chmod +x                                                            /usr/sbin/mysqld



# Configure MySQL
RUN rm -rf                                                              /var/lib/mysql/*
# Remove syslog configuration
RUN mkdir -p                                                            /etc/mysql/conf.d/
RUN rm -rf                                                              /etc/mysql/conf.d/mysqld_safe_syslog.cnf
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