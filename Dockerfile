FROM ubuntu:14.04

MAINTAINER b225ccc@gmail.com

# install dependencies
RUN \
  sed -i 's/# \(.*multiverse$\)/\1/g' /etc/apt/sources.list && \
  apt-get update && \
  apt-get -y upgrade && \
  apt-get install -y software-properties-common && \
  add-apt-repository -y ppa:deluge-team/ppa && \
  apt-get update && \
  apt-get install -y deluge supervisor unzip unrar && \
  apt-get clean && \
  rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

RUN \
  mkdir -p /var/log/supervisor

# create deluge user
# user will default to the 'nogroup' group
RUN \
  groupadd --system --gid 1002 torrent && \
  adduser --system --uid 65000 --no-create-home deluge && \
  usermod -aG torrent deluge

# add custom files
COPY supervisord.conf /etc/supervisor/conf.d/supervisord.conf

# volumes
VOLUME /config /tv /movies /music

# ports
EXPOSE 8112 58846 58946 58946/udp

CMD ["/usr/bin/supervisord"]
