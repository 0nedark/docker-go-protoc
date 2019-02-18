FROM golang:alpine3.8

RUN apk add --update --no-cache protobuf \
  && apk add --no-cache --virtual .deps git \
  && go get -u github.com/golang/protobuf/protoc-gen-go \
  && cd $GOPATH/src/github.com/golang/protobuf/protoc-gen-go \
  && git checkout v1.2.0 \
  && go install \
  && rm -fr $GOPATH/src \
  && apk del .deps

WORKDIR /
ENTRYPOINT ["tail", "-f", "/dev/null"]
