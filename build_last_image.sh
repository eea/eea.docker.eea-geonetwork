#!/bin/bash

#exec > /dev/null 2>&1
id=$(curl -s https://files.titellus.net/geonetwork/eea/ | grep eea-catalogues | tail -1 | cut -c 135-174  )

echo building for $id
docker build -t eeacms/eea-geonetwork:$id --build-arg id=$id ./geonetwork/

echo build ready for $id
