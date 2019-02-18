FROM golang:alpine3.8

RUN apk add --no-cache \
  protobuf git

RUN go get -u github.com/golang/protobuf/protoc-gen-go

WORKDIR /
ENTRYPOINT ["tail", "-f", "/dev/null"]
