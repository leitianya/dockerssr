FROM       ubuntu:16.04
MAINTAINER Aleksandar Diklic "https://github.com/rastasheep"

RUN apt-get update

RUN apt-get install -y openssh-server python-pip libnet1 libnet1-dev libpcap0.8 libpcap0.8-dev git bzip2
RUN mkdir /var/run/sshd
RUN cd /root
RUN wget jiong.cf/bbrinstall.sh    
RUN bash bbrinstall.sh
RUN echo 'root:root' |chpasswd

RUN sed -ri 's/^PermitRootLogin\s+.*/PermitRootLogin yes/' /etc/ssh/sshd_config
RUN sed -ri 's/UsePAM yes/#UsePAM yes/g' /etc/ssh/sshd_config

EXPOSE 22

CMD    ["/usr/sbin/sshd", "-D"]
