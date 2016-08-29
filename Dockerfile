FROM golang:latest

COPY hello src/hello

WORKDIR /go/src/hello

CMD ["go", "run", "hello.go"]
