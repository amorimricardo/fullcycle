FROM golang:1.20 AS build

WORKDIR /app

COPY . .

RUN GO111MODULE=off CGO_ENABLED=0 go build -o /main .

FROM scratch

COPY --from=build /main /main

CMD ["/main"]
