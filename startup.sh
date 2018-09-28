#!/bin/bash
set -e

file=./usr/local/tomcat/webapps/geonetwork/WEB-INF/config-summary.xml
if [ ! -e "$file" ]; then
    mkdir -p /usr/local/tomcat/webapps/geonetwork/WEB-INF/
    cp /webapps/config-summary.xml /usr/local/tomcat/webapps/geonetwork/WEB-INF/config-summary.xml

file=./usr/local/tomcat/webapps/geonetwork/catalog/views/default/templates/recordView.html
if [ ! -e "$file" ]; then
    mkdir -p /usr/local/tomcat/webapps/geonetwork/catalog/views/default/templates/
    cp /webapps/recordView.html /usr/local/tomcat/webapps/geonetwork/catalog/views/default/templates/recordView.html

file=./webapps/config-lucene.xml /usr/local/tomcat/webapps/geonetwork/WEB-INF/config-lucene.xml
if [ ! -e "$file" ]; then
    mkdir -p /usr/local/tomcat/webapps/geonetwork/WEB-INF/
    cp /webapps/config-lucene.xml /usr/local/tomcat/webapps/geonetwork/WEB-INF/config-lucene.xml

file=./usr/local/tomcat/webapps/geonetwork/catalog/locales/en-core.json
if [ ! -e "$file" ]; then
    mkdir -p /usr/local/tomcat/webapps/geonetwork/catalog/locales/
    cp /webapps/en-core.json /usr/local/tomcat/webapps/geonetwork/catalog/locales/en-core.json

file=./usr/local/tomcat/webapps/geonetwork/images/harvesting/EEA.png
if [ ! -e "$file" ]; then
    mkdir -p /usr/local/tomcat/webapps/geonetwork/images/harvesting/
    cp /webapps/EEA.png  /usr/local/tomcat/webapps/geonetwork/images/harvesting/EEA.png

#exec /entrypoint.sh "$@"
