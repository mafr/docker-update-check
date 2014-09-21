FROM ubuntu:14.04

ADD docker.list /etc/apt/sources.list.d/
RUN apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys 36A1D7869245C8950F966E92D8576A8BA88D21E9

RUN apt-get update
RUN DEBIAN_FRONTEND=noninteractive apt-get install -y update-notifier-common lxc-docker

ADD check.sh /

ENTRYPOINT ["/check.sh"]
