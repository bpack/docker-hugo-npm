FROM alpine:3.6
MAINTAINER Benjamin Pack <mail@benjaminpack.com>

ARG HUGO_VER=0.26
ARG HUGO_SHA=67e4ba5ec2a02c8164b6846e30a17cc765b0165a5b183d5e480149baf54e1a50
ARG HUGO_URL=https://github.com/spf13/hugo/releases/download

RUN apk update && apk upgrade
RUN apk add --update --no-cache \
    bash \
    ca-certificates \
    curl \
    git \
    openssh-client \
    nodejs \
    nodejs-npm \
    python \
    py-pip

RUN pip install --upgrade pip
RUN pip install Pygments

RUN curl -Ls ${HUGO_URL}/v${HUGO_VER}/hugo_${HUGO_VER}_Linux-64bit.tar.gz -o /tmp/hugo.tar.gz \
    && echo "${HUGO_SHA}  /tmp/hugo.tar.gz" | sha256sum -c - \
    && tar xf /tmp/hugo.tar.gz -C /tmp \
    && mv /tmp/hugo /usr/bin/hugo \
    && rm -rf /tmp/hugo* \

