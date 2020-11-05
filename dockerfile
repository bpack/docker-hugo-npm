FROM debian:buster-slim
MAINTAINER Benjamin Pack <mail@benjaminpack.com>

ARG HUGO_VER=0.78.1
ARG HUGO_SHA=5640a2ff09f6ac6c860059f1fcf76d8e91575f81fdd94d8be3be8fc88be7a158
ARG HUGO_URL=https://github.com/gohugoio/hugo/releases/download
ARG HUGO_PKG=hugo_extended_${HUGO_VER}_Linux-64bit.deb

RUN apt update && apt install -y \
    curl \
    git \
    nodejs \
    npm \
    python \
    python-pip

RUN pip install --upgrade pip
RUN pip install Pygments

RUN curl -Ls ${HUGO_URL}/v${HUGO_VER}/${HUGO_PKG} -o /tmp/${HUGO_PKG} \
    && echo "${HUGO_SHA}  /tmp/${HUGO_PKG}" | sha256sum -c - \
    && dpkg -i "/tmp/${HUGO_PKG}" \
    && rm -rf /tmp/hugo*

