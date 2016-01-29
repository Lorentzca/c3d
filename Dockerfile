FROM centos:7

# install consul
RUN \
  yum install -y curl wget unzip bind-utils && \
  wget --no-check-certificate -O consul.zip https://releases.hashicorp.com/consul/0.6.0/consul_0.6.0_linux_amd64.zip && \
  unzip consul.zip && \
  rm -f consul.zip && \
  mv consul /usr/local/sbin && \
  chmod 755 /usr/local/sbin/consul && \
  mkdir -p /etc/consul.d/{server,client}

# configure consul
COPY ./server.json    /etc/consul.d/server/config.json
COPY ./client.json    /etc/consul.d/client/config.json

# consul web ui
COPY ./consul_web_ui /var/www/consul_web_ui
