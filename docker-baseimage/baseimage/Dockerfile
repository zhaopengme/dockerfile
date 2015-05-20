FROM phusion/baseimage:0.9.16
MAINTAINER mikey.zhaopeng <user.zhaopeng@gmail.com>

# Use baseimage-docker's init system.
CMD ["/sbin/my_init"]

# Change source
RUN cp /etc/apt/sources.list /etc/apt/sources.list.backup
RUN rm /etc/apt/sources.list
ADD build/source/alisources.list /etc/apt/sources.list

RUN apt-get update

RUN DEBIAN_FRONTEND="noninteractive" apt-get install -y vim curl wget lrzsz unzip

# ...put your own build instructions here...

# Clean up APT when done.
RUN apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*