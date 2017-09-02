OWNER ?= bpack
REPO ?= hugo-npm
VERSION ?= latest

build:
	docker build -t $(OWNER)/$(REPO):$(VERSION) .

push:
	docker push $(OWNER)/$(REPO):$(VERSION)

sh:
	docker run --rm -i -t $(OWNER)/$(REPO):$(VERSION) /bin/bash

