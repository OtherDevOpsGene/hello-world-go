FROM golang:1.20-bullseye AS dev
WORKDIR /app

COPY go.mod ./
RUN go mod download
COPY *.go ./

RUN go build -o /hello

FROM scratch AS runtime
COPY --from=dev /hello /

ENTRYPOINT ["/hello"]
