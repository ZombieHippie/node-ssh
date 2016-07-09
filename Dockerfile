FROM mhart/alpine-node:5.12.0

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

WORKDIR /bin

ADD setup-ssh-keys /bin/
RUN chmod +x /bin/setup-ssh-keys

CMD ["/bin/setup-ssh-keys"]
