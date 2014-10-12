IMAGE = ubuntu14.04-template
CONTAINER = basicexample
DATA = datacon
USER = user

all: build createdata run getdata

# WORK WITH IMAGE
build:
	docker build -t $(IMAGE) .

rebuild:
	docker build --no-cache=true -t $(IMAGE) .

run:
	docker run -dt --name $(CONTAINER) $(IMAGE)

stop:
	docker stop $(CONTAINER)
	docker rm $(CONTAINER)

restart: stop run

runbash:
	docker run -it --rm --name $(CONTAINER) $(IMAGE) /bin/bash

enterimage:
	docker-enter $(CONTAINER)

# WORK WITH DATA
createdata:
	docker stop $(DATA)
	docker rm $(DATA)
	docker run -dt --name $(DATA) -v /usr/data/ busybox
	docker run -it --rm --volumes-from $(DATA)        \
		-v $(shell pwd)/input:/tmp/input ubuntu       \
		sh -c 'cp -r /tmp/input/* /usr/data/;   \
			useradd $(USER);                    \
			chown -R $(USER):$(USER) /usr/data/*'

enterdata:
	docker-enter $(DATA)

getdata:
	docker run -it --rm --volumes-from $(DATA)     \
		-v $(shell pwd)/output:/tmp/output busybox \
		sh -c 'cp -r /usr/data/* /tmp/output/'
	chown -R $(shell printenv SUDO_USER):$(shell printenv SUDO_USER) output/*

