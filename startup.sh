#!/bin/bash
set -e

if [ -f /webapps/geonetwork.war ] ; then
    rm -rf /usr/local/tomcat/webapps/geonetwork.war
    rm -rf /usr/local/tomcat/webapps/geonetwork/*
    mkdir -p /usr/local/tomcat/webapps/geonetwork/
    mv /webapps/geonetwork.war /usr/local/tomcat/webapps/geonetwork/
    cd /usr/local/tomcat/webapps/geonetwork
    unzip geonetwork.war
fi

if [ "$1" = 'catalina.sh' ]; then
        mkdir -p "$DATA_DIR"
        #Set geonetwork data dir
        export CATALINA_OPTS="$CATALINA_OPTS -Dgeonetwork.dir=$DATA_DIR"
fi

exec "$@"
