REGISTRY = 452158872079.dkr.ecr.us-east-1.amazonaws.com
IMAGE = rp-indexer-rapidpro
BUILD_NUMBER?=latest

.PHONY: build release

all: build release

build:
	docker build -t $(REGISTRY)/$(IMAGE):$(BUILD_NUMBER) .

release:
	@if ! docker images $(REGISTRY)/$(IMAGE) | awk '{ print $$2 }' | grep -q -F $(BUILD_NUMBER); then echo "$(REGISTRY)/$(IMAGE) version $(BUILD_NUMBER) is not yet built. Please run 'make build'"; false; fi
	docker push $(REGISTRY)/$(IMAGE):$(BUILD_NUMBER)

clean:
	docker rmi $(REGISTRY)/$(IMAGE):$(VERSION)