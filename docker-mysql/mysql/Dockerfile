FROM phusion/baseimage:0.9.16
MAINTAINER mikey.zhaopeng <user.zhaopeng@gmail.com>

# Default baseimage settings
ENV HOME /root
RUN /etc/my_init.d/00_regen_ssh_host_keys.sh
CMD ["/sbin/my_init"]
ENV DEBIAN_FRONTEND noninteractive

# Change source
RUN cp /etc/apt/sources.list /etc/apt/sources.list.backup
RUN rm /etc/apt/sources.list
ADD build/source/alisources.list                                                 /etc/apt/sources.list

# Update software list, install MySQL
RUN apt-get update && \
    apt-get install -yq mysql-server-5.6 pwgen && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/* \
           /tmp/* \
           /var/tmp/*

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
