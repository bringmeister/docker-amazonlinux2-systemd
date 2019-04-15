FROM amazonlinux:2
#LABEL maintainer=""
ENV container=docker

# Install systemd -- See https://hub.docker.com/_/centos/
RUN yum -y update; yum clean all;

# Install requirements.
RUN yum makecache fast \
 && yum -y install deltarpm epel-release initscripts \
 && yum -y update \
 && yum -y install \
      sudo \
      which \
      python-pip \
      cronie \
 && yum clean all

RUN rm -rf /var/cache/yum

VOLUME ["/sys/fs/cgroup"]
CMD ["/usr/lib/systemd/systemd"]