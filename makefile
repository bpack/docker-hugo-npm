OWNER ?= bpack
REPO ?= hugo-npm
VERSION ?= latest

build:
	docker build -t $(OWNER)/$(REPO):$(VERSION) .

push:
	docker login -u $(OWNER)
	docker push $(OWNER)/$(REPO):$(VERSION)

shell:
	docker run --rm -i -t $(OWNER)/$(REPO):$(VERSION) /bin/bash

rmi:
	docker rmi -f $(OWNER)/$(REPO)
