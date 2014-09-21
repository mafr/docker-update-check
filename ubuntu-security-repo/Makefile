TAG = mafr/ubuntu-security-repo
NAME = ubuntu-security-repo

build:
	docker build -t $(TAG) .

run: build
	docker run --detach --name $(NAME) $(TAG)

interactive: build
	docker run -t -i --rm --name $(NAME) --entrypoint /bin/bash $(TAG)
