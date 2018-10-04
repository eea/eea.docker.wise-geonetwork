#!/bin/bash
set -e

if [ -d /webapps/geonetwork ] && [ ! -d /usr/local/tomcat/webapps/geonetwork ] ; then
    mv /webapps/geonetwork  /usr/local/tomcat/webapps/
fi

if [ "$1" = 'catalina.sh' ]; then
        mkdir -p "$DATA_DIR"
        #Set geonetwork data dir
        export CATALINA_OPTS="$CATALINA_OPTS -Dgeonetwork.dir=$DATA_DIR"
fi

exec "$@"
