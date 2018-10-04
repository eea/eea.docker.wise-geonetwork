#!/bin/bash
set -e

echo "Starting sleep"
sleep 5
echo "End sleep"

file=/usr/local/tomcat/webapps/geonetwork/WEB-INF/config-summary.xml
if [ ! -f "$file" ]; then
    mkdir -p /usr/local/tomcat/webapps/geonetwork/WEB-INF/
    cp /webapps/config-summary.xml /usr/local/tomcat/webapps/geonetwork/WEB-INF/config-summary.xml
fi
ls $file

file=/usr/local/tomcat/webapps/geonetwork/catalog/views/default/templates/recordView.html
if [ ! -f "$file" ]; then
    mkdir -p /usr/local/tomcat/webapps/geonetwork/catalog/views/default/templates/
    cp /webapps/recordView.html /usr/local/tomcat/webapps/geonetwork/catalog/views/default/templates/recordView.html
fi
ls $file

file=/usr/local/tomcat/webapps/geonetwork/WEB-INF/config-lucene.xml
if [ ! -f "$file" ]; then
    mkdir -p /usr/local/tomcat/webapps/geonetwork/WEB-INF/
    cp /webapps/config-lucene.xml /usr/local/tomcat/webapps/geonetwork/WEB-INF/config-lucene.xml
fi
ls $file

file=/usr/local/tomcat/webapps/geonetwork/catalog/locales/en-core.json
if [ ! -f "$file" ]; then
    mkdir -p /usr/local/tomcat/webapps/geonetwork/catalog/locales/
    cp /webapps/en-core.json /usr/local/tomcat/webapps/geonetwork/catalog/locales/en-core.json
fi
ls $file

file=/usr/local/tomcat/webapps/geonetwork/images/harvesting/EEA.png
if [ ! -f "$file" ]; then
    mkdir -p /usr/local/tomcat/webapps/geonetwork/images/harvesting/
    cp /webapps/EEA.png  /usr/local/tomcat/webapps/geonetwork/images/harvesting/EEA.png
 fi
ls $file

echo "Finished script"

if [ "$1" = 'catalina.sh' ]; then
    echo "Mkdir data"
    mkdir -p "$DATA_DIR"
    echo "Intrat in IF"
    #Set geonetwork data dir
    export CATALINA_OPTS="$CATALINA_OPTS -Dgeonetwork.dir=$DATA_DIR"
exec "$@"
