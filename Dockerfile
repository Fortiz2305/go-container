FROM alpine:3.5
MAINTAINER Francisco Ortiz <fortizabril@gmail.com>

ENV GOLANG_VERSION=1.8

RUN set -ex \
  && apk add --no-cache --virtual .build-deps bash gcc musl-dev go openssl \
  && wget https://storage.googleapis.com/golang/go$GOLANG_VERSION.src.tar.gz -O go.tar.gz \
  && tar -C /usr/local -xzf go.tar.gz \
  && rm go.tar.gz \
  && cd /usr/local/go/src \
  && export GOROOT_BOOTSTRAP="$(go env GOROOT)" \
  && ./make.bash \
  && apk del .build-deps

ENV GOPATH=/go \
    PATH=$GOPATH/bin:/usr/local/go/bin:$PATH \
    GOSRC=$GOPATH/src \
    GOBIN=$GOPATH/bin

RUN mkdir -p "$GOSRC" "$GOBIN"

COPY hello $GOSRC/hello

WORKDIR $GOSRC/hello

CMD go test \
  && go run hello.go
