TAG = mafr/ubuntu-security-check
NAME = ubuntu-security-check
REPO_NAME = ubuntu-security-repo

# Run via:
#   make run CONTAINER_TO_CHECK=my-container-name"
#
CONTAINER_TO_CHECK =


build:
	docker build -t $(TAG) .

run: check-params
	docker run --rm --name=$(NAME) --volumes-from=$(REPO_NAME) \
		--volume=/var/run/docker.sock:/var/run/docker.sock \
		--env CONTAINER_TO_CHECK=$(CONTAINER_TO_CHECK) \
		$(TAG)

interactive: check-params
	docker run -t -i --rm --name=$(NAME) --volumes-from=$(REPO_NAME) \
		--volume=/var/run/docker.sock:/var/run/docker.sock \
		--entrypoint /bin/bash \
		--env CONTAINER_TO_CHECK=$(CONTAINER_TO_CHECK) \
		$(TAG)

check-params:
ifndef CONTAINER_TO_CHECK
	$(error Variable CONTAINER_TO_CHECK must be set)
endif
