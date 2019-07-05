FROM openjdk:8-jre-alpine

LABEL description="Apache ActiveMQ 5.15.9 version docker image"
LABEL maintainer="Shaofeng Liu"

#exact the activemq and change the permission in jetty-realm.properties
RUN mkdir -p /ActiveMQ

COPY activemq /ActiveMQ

RUN chmod +x /ActiveMQ/apache-activemq-5.15.9/bin/activemq

CMD ["/bin/sh", "-c", "ActiveMQ/apache-activemq-5.15.9/bin/activemq console"]