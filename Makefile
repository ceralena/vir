all: lint
	go build ./...

lint: gofmt gometalinter

gofmt:
	find . -name '*.go' -not -path './vendor/*' | xargs gofmt -w

gometalinter:
	gometalinter \
		--exclude=vendor/ \
		--deadline=60s \
		--enable=errcheck \
		--enable=golint \
		--enable=unparam \
		--enable=vet \
		--enable=varcheck \
		./...
