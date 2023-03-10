# Build on Ubuntu
FROM golang:1.20-bullseye AS dev
# Create a non-root user
RUN useradd -u 10001 scratchuser

# Compile the app
WORKDIR /app

COPY go.mod ./
RUN go mod download
COPY *.go ./

RUN go build -o /hello

# Copy onto scratch to minimize image size
FROM scratch AS runtime
COPY --from=dev /hello /

# Copy non-root user
COPY --from=dev /etc/passwd /etc/passwd
USER scratchuser

# Default to running the app
ENTRYPOINT ["/hello"]

# Nothing to check since it is ephemeral
HEALTHCHECK NONE
