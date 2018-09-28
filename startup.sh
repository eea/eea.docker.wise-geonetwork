#!/bin/bash
set -e

mkdir -p /usr/local/tomcat/webapps/geonetwork/WEB-INF/
cp /tmp/config-summary.xml /usr/local/tomcat/webapps/geonetwork/WEB-INF/config-summary.xml

mkdir -p /usr/local/tomcat/webapps/geonetwork/catalog/views/default/templates/
cp /tmp/recordView.html /usr/local/tomcat/webapps/geonetwork/catalog/views/default/templates/recordView.html

mkdir -p /usr/local/tomcat/webapps/geonetwork/WEB-INF/
cp /tmp/config-lucene.xml /usr/local/tomcat/webapps/geonetwork/WEB-INF/config-lucene.xml

mkdir -p /usr/local/tomcat/webapps/geonetwork/catalog/locales/
cp /tmp/en-core.json /usr/local/tomcat/webapps/geonetwork/catalog/locales/en-core.json

mkdir -p /usr/local/tomcat/webapps/geonetwork/images/harvesting/
cp /tmp/EEA.png  /usr/local/tomcat/webapps/geonetwork/images/harvesting/EEA.png

mkdir -p /usr/local/tomcat/webapps/geonetwork/WEB-INF/data/config/schema_plugins/
cp -r /tmp/msfd-ind /usr/local/tomcat/webapps/geonetwork/WEB-INF/data/config/schema_plugins/msfd-ind

mkdir -p /usr/local/tomcat/webapps/geonetwork/WEB-INF/classes/setup/sql/data

# chown -R root:root /usr/local/tomcat/
# chmod -R 777 /usr/local/tomcat/

exec /entrypoint.sh "$@"
