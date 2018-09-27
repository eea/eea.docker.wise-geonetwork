FROM geonetwork:3.4.2

MAINTAINER michimau <mauro.michielon@eea.europa.eu>

RUN apt-get -y update
RUN apt-get -y install locate vim

COPY config-summary.xml /
COPY config-lucene.xml /
COPY en-core.json /
COPY recordView.html /
COPY EEA.png /
COPY msfd-ind /


RUN rm -rf /usr/local/tomcat/webapps/examples*
RUN rm -rf /usr/local/tomcat/webapps/docs*
RUN rm -rf /usr/local/tomcat/webapps/ROOT*
RUN rm -rf /usr/local/tomcat/webapps/host-manager*
RUN rm -rf /usr/local/tomcat/webapps/manager*
RUN rm -rf /usr/local/tomcat/webapps/src*

COPY config-summary.xml /tmp/
COPY recordView.html /tmp/
COPY config-lucene.xml /tmp/
COPY en-core.json /tmp/
COPY EEA.png /tmp/
RUN mkdir -p /tmp/msfd-ind
COPY msfd-ind /tmp/msfd-ind

COPY startup.sh /

RUN chmod +x /startup.sh

ENTRYPOINT [ "/startup.sh" ]
#ENTRYPOINT [ "/entrypoint.sh" ]


CMD ["catalina.sh","run"]

#RUN mv /usr/local/tomcat/webapps/geonetwork /usr/local/tomcat/webapps/ROOT
