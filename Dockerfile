FROM golang:1.13-alpine AS builder
COPY . /go/src/github.com/gkawamoto/hawtio
WORKDIR /go/src/github.com/gkawamoto/hawtio
RUN go build -o /entrypoint .

FROM openjdk:8-alpine
ENV XMX 512M
ENV XMS 256M
EXPOSE 8080
COPY --from=builder /entrypoint /entrypoint
ADD https://oss.sonatype.org/content/repositories/public/io/hawt/hawtio-app/2.7.1/hawtio-app-2.7.1.jar /app/hawtio.jar
ENTRYPOINT ["/entrypoint"]
