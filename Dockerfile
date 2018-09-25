FROM geonetwork:3.4.2

MAINTAINER michimau <mauro.michielon@eea.europa.eu>

RUN apt-get -y update
RUN apt-get -y install locate vim

COPY config-summary.xml /
COPY config-lucene.xml /
COPY en-core.json /
COPY recordView.html /
COPY EEA.png /

RUN rm -rf /usr/local/tomcat/webapps/examples*
RUN rm -rf /usr/local/tomcat/webapps/docs*
RUN rm -rf /usr/local/tomcat/webapps/ROOT*
RUN rm -rf /usr/local/tomcat/webapps/host-manager*
RUN rm -rf /usr/local/tomcat/webapps/manager*
RUN rm -rf /usr/local/tomcat/webapps/src*

COPY config-summary.xml /tmp/config-summary.xml
COPY recordView.html /tmp/recordView.html
COPY config-lucene.xml /tmp/config-lucene.xml
COPY en-core.json /tmp/en-core.json
COPY EEA.png /tmp/EEA.png
RUN mkdir -p /tmp/msfd-ind
COPY msfd-ind /tmp/msfd-ind

COPY startup.sh /
RUN chmod 777 startup.sh

#RUN mv /usr/local/tomcat/webapps/geonetwork /usr/local/tomcat/webapps/ROOT
