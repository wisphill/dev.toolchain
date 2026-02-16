FROM golang:1.22-alpine

ARG PROTOC_VERSION=25.3

RUN apk add --no-cache \
    git \
    make \
    bash \
    curl \
    unzip

# Install protoc
RUN curl -LO https://github.com/protocolbuffers/protobuf/releases/download/v${PROTOC_VERSION}/protoc-${PROTOC_VERSION}-linux-x86_64.zip && \
    unzip protoc-${PROTOC_VERSION}-linux-x86_64.zip -d /usr/local && \
    rm protoc-${PROTOC_VERSION}-linux-x86_64.zip

# Install Go protobuf plugins (pinned versions)
RUN go install google.golang.org/protobuf/cmd/protoc-gen-go@v1.33.0 && \
    go install google.golang.org/grpc/cmd/protoc-gen-go-grpc@v1.3.0

ENV PATH="/go/bin:/usr/local/bin:$PATH"

WORKDIR /workspace

CMD ["bash"]
