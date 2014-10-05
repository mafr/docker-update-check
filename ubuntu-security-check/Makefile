TAG = mafr/ubuntu-security-check

build:
	docker build -t $(TAG) .

#
# Everything below this line is for testing and debugging only.
#
# Run via:
#   make run CONTAINER_TO_CHECK=my-container-name"
#
REPO_NAME = ubuntu-security-repo
CONTAINER_TO_CHECK =

run: check-params
	docker run --rm --volumes-from=$(REPO_NAME):ro \
		--volume=/var/run/docker.sock:/var/run/docker.sock \
		--env CONTAINER_TO_CHECK=$(CONTAINER_TO_CHECK) \
		$(TAG)

interactive: check-params
	docker run -t -i --rm --volumes-from=$(REPO_NAME):ro \
		--volume=/var/run/docker.sock:/var/run/docker.sock \
		--entrypoint=/bin/bash \
		--env CONTAINER_TO_CHECK=$(CONTAINER_TO_CHECK) \
		$(TAG)

check-params:
ifndef CONTAINER_TO_CHECK
	$(error Variable CONTAINER_TO_CHECK must be set)
endif
