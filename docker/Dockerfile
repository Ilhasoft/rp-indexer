FROM golang:1.23-bookworm AS builder

WORKDIR /src

COPY go.mod go.sum ./
RUN go mod download -x

COPY . ./

RUN GOOS=linux GOARCH=amd64 go build -o /bin/rp-indexer ./cmd/rp-indexer/*.go

FROM gcr.io/distroless/base-debian12

WORKDIR /app

COPY --from=builder bin/rp-indexer ./

EXPOSE 8080
ENTRYPOINT ["./rp-indexer"]
