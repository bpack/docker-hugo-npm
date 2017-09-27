FROM alpine:3.6
MAINTAINER Benjamin Pack <mail@benjaminpack.com>

ARG HUGO_VER=0.29
ARG HUGO_SHA=80011b40b64781a5adfbf882fe3ab3b3c526e9ba8583fb532cd2331ffbe44a9e
ARG HUGO_URL=https://github.com/spf13/hugo/releases/download
ARG HUGO_TGZ=hugo_${HUGO_VER}_Linux-64bit.tar.gz

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

RUN curl -Ls ${HUGO_URL}/v${HUGO_VER}/${HUGO_TGZ} -o /tmp/hugo.tar.gz \
    && echo "${HUGO_SHA}  /tmp/hugo.tar.gz" | sha256sum -c - \
    && tar xf /tmp/hugo.tar.gz -C /tmp \
    && mv /tmp/hugo /usr/bin/hugo \
    && rm -rf /tmp/hugo* 

