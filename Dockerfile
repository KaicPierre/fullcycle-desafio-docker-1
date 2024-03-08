FROM golang:alpine3.19 AS builder

WORKDIR /app

COPY . .

RUN go mod init example/hello
RUN go build

FROM scratch

WORKDIR /app

COPY --from=builder /app/hello  /app

CMD [ "./hello" ]clear




