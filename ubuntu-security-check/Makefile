TAG = mafr/ubuntu-security-check
NAME = ubuntu-security-check
REPO_NAME = ubuntu-security-repo

# Override via "make run CONTAINER_TO_CHECK=my-container-name" 
CONTAINER_TO_CHECK = ubuntu-security-check


build:
	docker build -t $(TAG) .

run:
	docker run --rm --name=$(NAME) --volumes-from=$(REPO_NAME) \
		--volume=/var/run/docker.sock:/var/run/docker.sock \
		--env CONTAINER_TO_CHECK=$(CONTAINER_TO_CHECK) \
		$(TAG)

interactive:
	docker run -t -i --rm --name=$(NAME) --volumes-from=$(REPO_NAME) \
		--volume=/var/run/docker.sock:/var/run/docker.sock \
		--entrypoint /bin/bash \
		--env CONTAINER_TO_CHECK=$(CONTAINER_TO_CHECK) \
		$(TAG)
