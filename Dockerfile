FROM nimmis/alpine-golang

MAINTAINER hcerwin <erwin@hcdesigns.nl>

# Install Git
RUN apk update && apk upgrade && apk add --no-cache bash git openssh

# Go packages
RUN go get -u github.com/olebedev/config
RUN go get -u github.com/go-redis/redis
RUN go get -u gopkg.in/kataras/iris.v6

# Create $GOPATH dirs
RUN mkdir -p /gopath/src
RUN mkdir -p /gopath/bin
RUN mkdir -p /gopath/lib

# Symlink directory
RUN ln -sfn /backup /gopath
