# Project: MozDef
# Author: 2xyo <yohann@lepage.info>
# Date: 2013
# usage:
#	make build	- build new image from Dockerfile
#	make debug	- debug run already created image by tag
#	make try	- build and run in debug mode

NAME=2xyo/MozDef
VERSION=0.1


build:
	docker build -t $(NAME):$(VERSION) .


run:
	docker run -p 9090:9090 -p 8080:8080 -p 8081:8081 -t -i $(NAME):$(VERSION)
	echo "YEAH BABY http://localhost:9090"

debug:build
	docker run -p 9090:9090 -p 8080:8080 -p 8081:8081 \
		-v $(shell pwd)/container/var/lib/elasticsearch:/var/lib/elasticsearch \
		-v $(shell pwd)/container/var/log/elasticsearch:/var/log/elasticsearch \
		-v $(shell pwd)/container/var/lib/mongodb:/var/lib/mongodb \
		-v $(shell pwd)/container/var/log/mongodb:/var/log/mongodb \
		-v $(shell pwd)/container/var/log/nginx:/var/log/nginx \
		-v $(shell pwd)/container/var/log/mozdef:/var/log/mozdef \
	 	-t -i $(NAME):$(VERSION) /bin/bash


try: build run


.PHONY: build debug run