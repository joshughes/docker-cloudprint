FROM golang:latest
MAINTAINER Kyle Lucy

CMD gcp-cups-connector -config-filename /config/gcp-cups-connector.config.json --log-to-console

RUN mkdir /config \
  && apt-get update \
  && apt-get install -y build-essential libcups2-dev libsnmp-dev libavahi-client-dev git bzr \
  && go get github.com/google/cloud-print-connector/... \
  && apt-get clean \ 
  && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/
  
VOLUME /config
