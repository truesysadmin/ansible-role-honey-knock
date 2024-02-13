FROM nmusatti/ubuntu2204-pys

ENV container docker

ARG DEBIAN_FRONTEND=noninteractive

LABEL maintainer="Denys Rastiegaiev <daaren@gmail.com>"

RUN apt-get update ; \
  apt-get install -y systemd systemd-sysv apt-utils gcc git python3 python3-dev python3-pip libssl-dev sudo iptables


RUN  apt-get clean ; \
  rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/* ; \
  cd /lib/systemd/system/sysinit.target.wants/ ; \
  ls | grep -v systemd-tmpfiles-setup | xargs rm -f $1 ; \
  rm -f /lib/systemd/system/multi-user.target.wants/* ; \
  rm -f /etc/systemd/system/*.wants/* ; \
  rm -f /lib/systemd/system/local-fs.target.wants/* ; \
  rm -f /lib/systemd/system/sockets.target.wants/*udev* ; \
  rm -f /lib/systemd/system/sockets.target.wants/*initctl* ; \
  rm -f /lib/systemd/system/basic.target.wants/* ; \
  rm -f /lib/systemd/system/anaconda.target.wants/* ; \
  rm -f /lib/systemd/system/plymouth* ; \
  rm -f /lib/systemd/system/systemd-update-utmp*

VOLUME [ "/sys/fs/cgroup" ]

CMD ["/usr/sbin/init"]
