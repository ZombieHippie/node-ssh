FROM mhart/alpine-node:5

RUN apk update && \
  apk add \
    ca-certificates \
    openssh git \
    bash \
    make gcc g++ python && \
  rm -rf \
    /var/cache/apk/*

ENV NPM_CONFIG_LOGLEVEL warn
ENV NPM_CONFIG_COLOR always
ENV FORCE_COLOR 1
ENV SHELL /bin/bash

ENV SSH_ID_RSA UNSPECIFIED
ENV SSH_KNOWN_HOSTS UNSPECIFIED

WORKDIR /node-ssh

ADD setup /node-ssh/

RUN chmod +x /node-ssh/setup

CMD ["/node-ssh/setup"]
