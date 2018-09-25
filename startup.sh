cp /tmp/config-summary.xml /usr/local/tomcat/webapps/geonetwork/WEB-INF/config-summary.xml
cp /tmp/recordView.html /usr/local/tomcat/webapps/geonetwork/catalog/views/default/templates/recordView.html
cp /tmp/config-lucene.xml /usr/local/tomcat/webapps/geonetwork/WEB-INF/config-lucene.xml
cp /tmp/en-core.json /usr/local/tomcat/webapps/geonetwork/catalog/locales/en-core.json
cp /tmp/EEA.png  /usr/local/tomcat/webapps/geonetwork/images/harvesting/EEA.png
mkdir -p /usr/local/tomcat/webapps/geonetwork/WEB-INF/data/config/schema_plugins/msfd-ind
cp -r /tmp/msfd-ind /usr/local/tomcat/webapps/geonetwork/WEB-INF/data/config/schema_plugins/msfd-ind

#!/bin/bash
set -e

if [ "$1" = 'catalina.sh' ]; then

        mkdir -p "$DATA_DIR"

        #Set geonetwork data dir
        export CATALINA_OPTS="$CATALINA_OPTS -Dgeonetwork.dir=$DATA_DIR"
fi

exec "$@"
