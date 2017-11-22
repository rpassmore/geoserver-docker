FROM neowaylabs/java8:latest
#FROM tomcat:9-jre8-alpine
#FROM openjdk:8-jre-alpine

ENV GEOSERVER_VERSION=2.12.1

EXPOSE 8080

ENV JAVA_OPTS -Xms128m -Xmx512m -XX:MaxPermSize=512m
ENV ADMIN_PASSWD geoserver

RUN apt-get install -qqy unzip && \
    wget --progress=bar:force:noscroll \
      -c http://downloads.sourceforge.net/project/geoserver/GeoServer/${GEOSERVER_VERSION}/geoserver-${GEOSERVER_VERSION}-bin.zip \
      -O /tmp/geoserver-${GEOSERVER_VERSION}-bin.zip \
    && unzip /tmp/geoserver-${GEOSERVER_VERSION}-bin.zip -d /opt \
    && rm /tmp/geoserver-${GEOSERVER_VERSION}-bin.zip \
    && cd /opt \
    && ln -s geoserver-${GEOSERVER_VERSION} geoserver

ADD 01_geoserver.sh /etc/my_init.d/01_geoserver.sh
RUN chmod +x /etc/my_init.d/01_geoserver.sh

CMD ["/sbin/my_init"]

RUN apt-get clean && \
    rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

