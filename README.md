# docker-geoserver

[Geoserver](http://geoserver.org/) docker

## Environment settings:

* JAVA_OPTS (default: -Xms128m -Xmx512m -XX:MaxPermSize=512m)
* ADMIN_PASSWD (default: geoserver)

## Exposed TCP ports:

* 8080: REST and Admin interface

## External host volumes:

* /geoserver_data/data --> /opt/geoserver/data_dir: default application data directory
* /geoserver_data/data/styles --> /opt/geoserver/data_dir/styles: styles (sld, xml, images) directory
