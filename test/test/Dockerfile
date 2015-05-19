#
# Nginx Dockerfile
#
# https://github.com/dockerfile/nginx
#

# Pull base image.
FROM ubuntu:14.04
ENV DEBIAN_FRONTEND noninteractive
# Change source
RUN cp /etc/apt/sources.list /etc/apt/sources.list.backup
RUN rm /etc/apt/sources.list
ADD build/source/alisources.list /etc/apt/sources.list


# Install Nginx.
RUN \
  apt-get update && \
  apt-get install -y nginx && \
  rm -rf /var/lib/apt/lists/* && \
  echo "\ndaemon off;" >> /etc/nginx/nginx.conf && \

# Define mountable directories.
VOLUME ["/var/www/html"]

#ADD index.html /var/www/html/index.html

# Define working directory.
WORKDIR /etc/nginx

# Define default command.
CMD ["nginx"]

# Expose ports.
EXPOSE 80

