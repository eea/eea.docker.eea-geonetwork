#!/bin/bash

#exec > /dev/null 2>&1
id=$(curl -s https://files.titellus.net/geonetwork/eea/?C=M | grep eea-catalogues | tail -1 | cut -c 135-174  )
#id=4060a422fada8c66b41105b6789f8bf6285641e4
echo building for $id
docker build --no-cache -t eeacms/eea-geonetwork:$id --build-arg id=$id ./geonetwork/

echo build ready for $id
