FROM alpine:latest AS builder
RUN apk update && apk add build-base git

RUN git clone https://github.com/justinfrankel/ninjam.git /ninjam && \
    cd /ninjam/ninjam/server && \
    make && \
    cp ninjamsrv /usr/local/bin/ninjamsrv

FROM alpine:latest
RUN apk add libgcc libstdc++
COPY --from=builder /ninjam/ninjam/server/ninjamsrv /usr/local/bin/ninjamsrv

RUN mkdir /ninjam
COPY server.cfg /ninjam/server.cfg
ENTRYPOINT ["ninjamsrv", "/ninjam/server.cfg"]

