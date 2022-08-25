#!/bin/bash

docker pull jetty:9-jdk8-eclipse-temurin

#exec > /dev/null 2>&1
id=$(curl -s https://files.titellus.net/geonetwork/eea-v4/?C=M | grep eea-catalogues | tail -1 | cut -c 135-174  )
#id=85431381ac68107bbcaebdfd2749fe69460d47c2
echo building for eeacms/eea-geonetwork:$id
docker build -t eeacms/eea-geonetwork:$id --build-arg id=$id ../geonetwork/

echo build ready for docker push eeacms/eea-geonetwork:$id
docker login
docker push eeacms/eea-geonetwork:$id
