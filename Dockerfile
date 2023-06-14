FROM golang:1.18 AS build

WORKDIR /app

COPY go.mod ./
COPY MyAppGo.go ./

RUN CGO_ENABLED=0 go build -o /server

FROM scratch

WORKDIR /

COPY --from=build /server /server

ENTRYPOINT ["/server"]