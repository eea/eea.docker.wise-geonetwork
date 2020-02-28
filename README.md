# eea.docker.wise-geonetwork

Some details on how to develop and rebuild this, in case there's a need.

The WISE Marine geonetwork is based on the Core Geonetwork, 3.10.x branch.


## Services:

- ``wise-geonetwork``: was meant to allow testing the deployed app from production
  Just copy it under ``./webapps``

- ``build``: To be used to make a new build of geonetwork. A build is a collection
  of war files. Use the ``build.sh`` script and this branch:
  https://github.com/tiberiuichim/core-geonetwork/tree/water

- ``deploy``: a service meant to allow testing the built geonetwork.


## Releases

To create a new docker image, just make a new Github release. See docker hub
page:
https://hub.docker.com/repository/docker/eeacms/wise-geonetwork/tags

### Deploying

If for some reason the deployment has a problem, or there's a need to manually
deploy a new geonetwork, dump the updated geonetwork.war in the
/usr/local/tomcat/webapps folder. Tomcat should automatically detect a newer
war and deploy that one.


## Developing

I've used the ``build`` container to build the geonetwork. Once the container
starts, use the ``./build.sh`` script inside
``/usr/local/tomcat/webapps/geonetwork-build`` to build the geonetwork. You can
also use the ``./run_dev_server.sh`` script to start a development version. See
[Geonetwork documentation](https://github.com/geonetwork/core-geonetwork/tree/master/software_development)

Change code in ``web-ui/src/main/resources/catalog/views``. Changes should be
automatically detected and observed by reloading the page in the browser.
