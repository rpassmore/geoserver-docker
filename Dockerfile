FROM neowaylabs/java8:latest
#FROM tomcat:9-jre8-alpine
#FROM openjdk:8-jre-alpine


EXPOSE 8080

ENV JAVA_OPTS -Xms128m -Xmx512m -XX:MaxPermSize=512m
ENV ADMIN_PASSWD geoserver

RUN apt-get install -qqy unzip && \
    wget -c http://downloads.sourceforge.net/project/geoserver/GeoServer/2.12.1/geoserver-2.12.1-bin.zip \
         -O /tmp/geoserver-2.12.1-bin.zip && \
    unzip /tmp/geoserver-2.12.1-bin.zip -d /opt && \
    cd /opt && \
    ln -s geoserver-2.12.1 geoserver

ADD 01_geoserver.sh /etc/my_init.d/01_geoserver.sh
RUN chmod +x /etc/my_init.d/01_geoserver.sh

CMD ["/sbin/my_init"]

RUN apt-get clean && \
    rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

