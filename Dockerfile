FROM ubuntu:14.04
MAINTAINER Casear casear.chu@chuto.tw

RUN echo "0.1" > .version
RUN echo deb http://archive.ubuntu.com/ubuntu precise universe > /etc/apt/sources.list.d/universe.list
RUN apt-get update
RUN apt-get install -y git build-essential libssl-dev wget curl python libzmq3
RUN apt-get install -y libzmq3-dev
RUN apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*
RUN git clone https://github.com/creationix/nvm.git /.nvm 
RUN echo ". /.nvm/nvm.sh" >> /etc/bash.bashrc
RUN /bin/bash -c '. /.nvm/nvm.sh && nvm install v0.10.20 && nvm use v0.10.20 && nvm alias default v0.10.20 && ln -s /.nvm/v0.10.20/bin/node /usr/bin/node && ln -s /.nvm/v0.10.20/bin/npm /usr/bin/npm'
VOLUME ['src','/src']
ADD init.sh init.sh
RUN chmod +x init.sh
ENTRYPOINT ["./init.sh"]

