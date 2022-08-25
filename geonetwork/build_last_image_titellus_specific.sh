#236fc887eeb76096d9cab7facc97e9e8bon!/bin/bash

docker pull jetty:9-jdk8-eclipse-temurin

#exec > /dev/null 2>&1
#id=$(curl -s https://files.titellus.net/geonetwork/eea-v4/?C=M | grep eea-catalogues | tail -1 | cut -c 135-174  )

id=$1

echo building for eeacms/eea-geonetwork:$id
docker build -t eeacms/eea-geonetwork:$id --build-arg id=$id -f Dockerfile_titellus .

echo build ready for docker push eeacms/eea-geonetwork:$id

docker login 
docker push eeacms/eea-geonetwork:$id

