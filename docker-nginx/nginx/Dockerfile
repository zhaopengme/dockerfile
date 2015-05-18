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


# Update software list, install nginx & clear cache
RUN apt-get update && \
    apt-get install -y nginx && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/* \
           /tmp/* \
           /var/tmp/*

# Configure nginx
RUN echo "daemon off;" >>                     /etc/nginx/nginx.conf
RUN mkdir -p                                  /var/www
RUN sed -i "s/sendfile on/sendfile off/"      /etc/nginx/nginx.conf

# Add nginx service
RUN mkdir                                     /etc/service/nginx
ADD build/run.sh                              /etc/service/nginx/run
RUN chmod +x                                  /etc/service/nginx/run

# Add nginx and MySQL volumes
VOLUME ["/var/www", "/etc/nginx/sites-available", "/etc/nginx/sites-enabled"]

EXPOSE 80
