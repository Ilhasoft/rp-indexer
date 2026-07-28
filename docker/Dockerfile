FROM golang:1.22-alpine

WORKDIR /app

RUN apk update \
  && apk add --virtual build-deps build-base git \
  && rm -rf /var/cache/apk/*

RUN addgroup -S golang \
  && adduser -S -G golang golang

COPY . .

RUN go install -v ./cmd/...
RUN chown -R golang /app

USER golang

EXPOSE 8080
ENTRYPOINT ["rp-indexer"]
