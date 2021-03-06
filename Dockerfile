FROM geonetwork:3.4.2

MAINTAINER michimau <mauro.michielon@eea.europa.eu>

RUN apt-get -y update

RUN rm -rf /usr/local/tomcat/webapps/examples* \
           /usr/local/tomcat/webapps/docs* \
          /usr/local/tomcat/webapps/ROOT* \
          /usr/local/tomcat/webapps/host-manager* \
          /usr/local/tomcat/webapps/manager* \
          /usr/local/tomcat/webapps/src*

COPY EEA.png /usr/local/tomcat/webapps/geonetwork/images/harvesting/EEA.png
COPY setenv.sh /usr/local/tomcat/bin/setenv.sh

# RUN cp -pr /usr/local/tomcat/webapps /webapps
# RUN cp ./dist/geonetwork.war /webapps
ADD ./dist/geonetwork.war /webapps/geonetwork.war

COPY startup.sh /

RUN chmod +x /startup.sh

ENTRYPOINT [ "/startup.sh" ]

CMD ["catalina.sh","run"]
