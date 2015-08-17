FROM ubuntu:14.04

RUN apt-get update
RUN DEBIAN_FRONTEND=noninteractive apt-get install -y apt-transport-https
ADD docker.list /etc/apt/sources.list.d/
RUN apt-key adv --keyserver hkp://p80.pool.sks-keyservers.net:80 --recv-keys 58118E89F3A912897C070ADBF76221572C52609D

RUN apt-get update
RUN DEBIAN_FRONTEND=noninteractive apt-get install -y update-notifier-common docker-engine

ADD apt.conf /security-check/
ADD check.sh /security-check/

ENTRYPOINT ["/security-check/check.sh"]
