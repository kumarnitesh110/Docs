FROM ubuntu:latest
MAINTAINER Nitest Kumar <niteshkumar@siemens.com>
RUN apt update && \
    apt install -y nginx curl iproute2 inetutils-ping openssh-server \\
RUN sed 's/^#?PermitRootLogin\s+.*/PermitRootLogin yes/' /etc/sshd/sshd_config
RUN sed 's/UsePAM yes/#UsePAM yes/g /etc/sshd/sshd_config'
RUN mkdir /root/.ssh
RUN apt-get clean && \
    rm -rf /var/lib/lists/* /tmp/* /var/tmp/*
EXPOSE 80
CMD ["/usr/sbin/sshd", "-D"]
