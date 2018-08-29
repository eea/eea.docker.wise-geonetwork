FROM geonetwork:3.4.2

MAINTAINER michimau <mauro.michielon@eea.europa.eu>

RUN apt-get -y update
RUN apt-get -y install locate vim

COPY config-lucene.xml /
COPY en-core.json /
COPY recordView.html /

RUN rm -rf /usr/local/tomcat/webapps/examples*
RUN rm -rf /usr/local/tomcat/webapps/docs*
RUN rm -rf /usr/local/tomcat/webapps/ROOT*
RUN rm -rf /usr/local/tomcat/webapps/host-manager*
RUN rm -rf /usr/local/tomcat/webapps/manager*
RUN rm -rf /usr/local/tomcat/webapps/src*

COPY recordView.html /usr/local/tomcat/webapps/geonetwork/catalog/views/default/templates/recordView.html
COPY config-lucene.xml /usr/local/tomcat/webapps/geonetwork/WEB-INF/config-lucene.xml
COPY en-core.json /usr/local/tomcat/webapps/geonetwork/catalog/locales/en-core.json
RUN mkdir -p /usr/local/tomcat/webapps/geonetwork/WEB-INF/data/config/schema_plugins/msfd-ind
COPY msfd-ind /usr/local/tomcat/webapps/geonetwork/WEB-INF/data/config/schema_plugins/msfd-ind

#RUN mv /usr/local/tomcat/webapps/geonetwork /usr/local/tomcat/webapps/ROOT
