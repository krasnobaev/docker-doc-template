Docker data-only container template
===================================

This is basic demonstration of interaction between basic docker container and
data-only container (DoC). This repository can be used as template for more
complex projects.

Features:
- default user in image and data container `user`
- data-only container commands in Makefile `createdata`, `enterdata`, `getdata`
- work with image `build`, `rebuild`, `run`, `stop`, `restart`
- to run bash in image `runbash`
- to enter running container `enterimage` and `enterdata`

Usage: `sudo make [command]`

Basic example which firstly push data from `input` folder into data-only
container, then pull this data to `output` folder.
```
git clone https://github.com/krasnobaev/docker-template
cd docker-template
sudo make all
```

If you give [docker non-root access](http://askubuntu.com/questions/477551/how-can-i-use-docker-without-sudo) you will be able to run `make` without `sudo`.

Requirements
------------

docker of course.

In order to use `sudo make enter` and `sudo make enterdata` you need
[https://github.com/jpetazzo/nsenter](nsenter).

Makefile.

git, if you want to clone this repository on your machine.

Links
-----
(Docker Data Only Container Demo)[https://github.com/toffer/docker-data-only-container-demo]

