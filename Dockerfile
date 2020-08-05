FROM node:latest
LABEL maintainer="land.d.nicholas@gmail.com"

RUN apt-get update
RUN apt-get upgrade -y
RUN apt-get install \
    apt-transport-https \
    ca-certificates \
    curl \
    gnupg-agent \
    software-properties-common -y
RUN curl -fsSL https://download.docker.com/linux/debian/gpg | apt-key add -
RUN add-apt-repository \
   "deb [arch=amd64] https://download.docker.com/linux/debian \
   $(lsb_release -cs) \
   stable" -y
RUN apt-get update
RUN apt-get install docker-ce docker-ce-cli containerd.io -y

VOLUME [ "/var/run/docker.sock" ]