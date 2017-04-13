FROM nimmis/alpine-golang

MAINTAINER hcerwin <erwin@hcdesigns.nl>

RUN apk update && apk upgrade && apk add --no-cache bash git openssh && \

    # Go packages
	go get -u github.com/olebedev/config && \
    go get -u github.com/go-redis/redis && \
	go get -u gopkg.in/kataras/iris.v6 && \

	# Symlink dir
	mkdir /gopath && \
	mkdir /gopath/bin && \
	mkdir /gopath/lib && \

	ln -s /backup /gopath

VOLUME ["/gopath"]

EXPOSE 8080

CMD ["cd", "/gopath/src/hcdesigns.nl/websocket-ticker"]
CMD ["go run", "*.go"]
