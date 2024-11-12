FROM golang:1.23.3-alpine3.20 AS builder

RUN go install github.com/air-verse/air@latest

WORKDIR /go/src/app

COPY . .
RUN go mod download && \
    CGO_ENABLED=0 go build -v -o api cmd/api/main.go

FROM gcr.io/distroless/base AS prod

COPY --from=builder /go/src/app/api .
CMD app

FROM builder AS dev

WORKDIR /go/src/app

CMD air