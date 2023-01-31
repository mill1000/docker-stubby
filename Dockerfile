# Build step
FROM alpine:latest
RUN apk add --update build-base cmake yaml-dev openssl-dev check-dev
WORKDIR /getdns
COPY getdns .
WORKDIR build
RUN cmake -DCMAKE_INSTALL_PREFIX=/usr/local -DENABLE_STUB_ONLY=ON -DBUILD_STUBBY=ON -DUSE_LIBIDN2=OFF ..
RUN make && make install DESTDIR=/getdns-install

# Production step
FROM alpine:latest
RUN apk add --update yaml tini
COPY --from=0 /getdns-install /
ENTRYPOINT ["/sbin/tini", "--"]
CMD ["/usr/local/bin/stubby"]