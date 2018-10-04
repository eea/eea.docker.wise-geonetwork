FROM geonetwork:3.4.2

MAINTAINER michimau <mauro.michielon@eea.europa.eu>

RUN apt-get -y update

RUN rm -rf /usr/local/tomcat/webapps/examples* \
           /usr/local/tomcat/webapps/docs* \
          /usr/local/tomcat/webapps/ROOT* \
          /usr/local/tomcat/webapps/host-manager* \
          /usr/local/tomcat/webapps/manager* \
          /usr/local/tomcat/webapps/src*

COPY config-summary.xml /usr/local/tomcat/webapps/geonetwork/WEB-INF/config-summary.xml
COPY recordView.html /usr/local/tomcat/webapps/geonetwork/catalog/views/default/templates/recordView.html
COPY config-lucene.xml /usr/local/tomcat/webapps/geonetwork/WEB-INF/config-lucene.xml
COPY en-core.json /usr/local/tomcat/webapps/geonetwork/catalog/locales/en-core.json
COPY EEA.png  /usr/local/tomcat/webapps/geonetwork/images/harvesting/EEA.png
RUN mkdir -p /usr/local/tomcat/webapps/geonetwork/WEB-INF/data/config/schema_plugins/msfd-ind
COPY msfd-ind /usr/local/tomcat/webapps/geonetwork/WEB-INF/data/config/schema_plugins/msfd-ind

RUN cp -pr /usr/local/tomcat/webapps /webapps

COPY startup.sh /

RUN chmod +x /startup.sh

ENTRYPOINT [ "/startup.sh" ]

CMD ["catalina.sh","run"]
