FROM zhaopengme/baseimage:latest
MAINTAINER mikey.zhaopeng <user.zhaopeng@gmail.com>

# Default baseimage settings
ENV HOME /root
ENV DEBIAN_FRONTEND noninteractive

# Update software list, install nginx & clear cache
RUN apt-get update && \
    apt-get install -y nginx && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/* \
           /tmp/* \
           /var/tmp/*

# Configure nginx
RUN echo "daemon off;" >>                     /etc/nginx/nginx.conf
RUN sed -i "s/sendfile on/sendfile off/"      /etc/nginx/nginx.conf
ADD build/default                     /etc/nginx/sites-available/default

# Add nginx service
RUN mkdir                                     /etc/service/nginx
ADD build/run.sh                              /etc/service/nginx/run
RUN chmod +x                                  /etc/service/nginx/run

EXPOSE 80
