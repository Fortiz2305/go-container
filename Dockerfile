FROM golang:latest
MAINTAINER Francisco Ortiz <fortizabril@gmail.com>

COPY hello src/hello

WORKDIR /go/src/hello

CMD go test && \
    go run hello.go