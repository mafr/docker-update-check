TAG = mafr/ubuntu-security-repo
NAME = ubuntu-security-repo

build:
	docker build -t $(TAG) .

run:
	docker run --detach --name=$(NAME) $(TAG)

update:
	docker run --rm --volumes-from=$(NAME) ubuntu:14.04 apt-get update

view:
	docker run -t -i --rm --volumes-from=$(NAME) busybox /bin/sh
