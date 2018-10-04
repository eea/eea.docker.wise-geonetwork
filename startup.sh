#!/bin/bash
set -e

if [ -d /webapps/geonetwork ] && [ ! -d /usr/local/tomcat/webapps/geonetwork ] ; then
    mv /webapps/geonetwork  /usr/local/tomcat/webapps/
fi

echo "Finished script"

if [ "$1" = 'catalina.sh' ]; then
        echo "Mkdir data"
        mkdir -p "$DATA_DIR"
        echo "Intrat in IF"
        #Set geonetwork data dir
        export CATALINA_OPTS="$CATALINA_OPTS -Dgeonetwork.dir=$DATA_DIR"
fi

exec "$@"
