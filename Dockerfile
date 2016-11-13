FROM alpine:latest
MAINTAINER Bo Cheng <chengbo1983@gmail.com>

ENV HUGO_VERSION=0.17
ENV HUGO_FILE=hugo_${HUGO_VERSION}_Linux-64bit.tar.gz

RUN apk add --update wget ca-certificates && \
  cd /tmp/ && \
  wget https://github.com/spf13/hugo/releases/download/v${HUGO_VERSION}/${HUGO_FILE} && \
  tar zxf ${HUGO_FILE} && \
  mv hugo*/hugo* /usr/bin/hugo && \
  rm ${HUGO_FILE}

COPY ./run.sh /run.sh

VOLUME /html
VOLUME /src

WORKDIR /src
CMD ["/run.sh"]
