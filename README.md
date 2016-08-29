# go-container

> Development container for Go

# Prerequisites

* Docker: https://docs.docker.com/engine/installation/

# Quickstart

## Build the image

```
$ docker build -t go-dev .
```

## Run the image

* Run go-dev, pass the tests and get your application running on http://localhost:8080. Also, it shares a volume with your computer so you can edit your code locally and see the changes on the browser.

```
$ docker run --rm -v /your/path/to/go-container/hello:/go/src/hello -t -i go-dev
```

* Run go-dev and get a shell where you can play

```
$ docker run -it -v /your/path/to/go-container/hello/:/go/src/hello go-dev /bin/bash 
```

## Using docker-compose

* It is also possible to run the image using docker-compose. Just go to the go-container directory and execute:

```
$ docker-compose up
```