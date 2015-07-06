FROM debian:jessie

ENV TELEGRAF_VERSION 0.1.2

RUN apt-get update && apt-get install -y curl
RUN curl -o /tmp/telegraf_$(echo $TELEGRAF_VERSION)_amd64.deb http://get.influxdb.org/telegraf/telegraf_$(echo $TELEGRAF_VERSION)_amd64.deb && \
    dpkg -i /tmp/telegraf_$(echo $TELEGRAF_VERSION)_amd64.deb

ENV PATH /opt/influxdb:$PATH

CMD ["telegraf", "-config", "/etc/opt/influxdb/telegraf.conf"]
