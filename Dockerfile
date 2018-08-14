FROM golang:1.10-alpine

# Prepare app source directory
ENV APP_PATH /go/src/github.com/nyaruka/rp-indexer
WORKDIR $APP_PATH
COPY . .

# Install rp-indexer application
RUN go get -d -v ./... && go install -v ./cmd/...

ENTRYPOINT ["rp-indexer"]