### This is a Todo base image

FROM ubuntu:14.04
MAINTAINER Max Meiden Dasuki <max@meidendasuki.com>

RUN echo "#!/bin/sh\nexit 0" > /usr/sbin/policy-rc.d

RUN apt-get update && DEBIAN_FRONTEND=noninteractive apt-get install -y openssh-server

#RUN mkdir /var/run/sshd
RUN sed -i 's/PermitRootLogin without-password/PermitRootLogin yes/' /etc/ssh/sshd_config

RUN mkdir ~/.ssh
ADD localdocker.pub /root/.ssh/authorized_keys
RUN chmod 600 ~/.ssh/authorized_keys

CMD ["/usr/sbin/sshd", "-D"]
