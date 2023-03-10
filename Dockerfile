FROM golang:1.20-bullseye
WORKDIR /app

COPY go.mod ./
RUN go mod download
COPY *.go ./

RUN go build -o /hello
ENTRYPOINT ["/hello"]
