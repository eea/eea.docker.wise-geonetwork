# eea.docker.wise-geonetwork

Some details on how to develop and rebuild this, in case there's a need:

First, the WISE Marine geonetwork is based on the Core Geonetwork, 3.10.x
branch.

I've used the ``build`` container to build the geonetwork. Once the container
starts, use the ``./build.sh`` script inside
``/usr/local/tomcat/webapps/geonetwork-build`` to build the geonetwork. You can
also use the ``./run_dev_server.sh`` script to start a development version. See
[Geonetwork documentation](https://github.com/geonetwork/core-geonetwork/tree/master/software_development)


## Services:

- ``wise-geonetwork``: was meant to allow testing the deployed app from production
  Just copy it under ``./webapps``

- ``build``: To be used to make a new build of geonetwork. A build is a collection
  of war files. Use the ``build.sh`` script and this branch:
  https://github.com/tiberiuichim/core-geonetwork/tree/water

- ``deploy``: a service meant to allow testing the built geonetwork.
