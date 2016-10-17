#!/bin/bash
set -e

#wget $URL -O /eea-catalogues.tar.gz
#
#tar -xvzf /eea-catalogues.tar.gz -C /

mkdir -p /catalogue-data/htmlcache
mkdir -p /editor-catalogue-data/htmlcache
mkdir -p /internal-catalogue-data/htmlcache
mkdir -p /map-catalogue-data/htmlcache

mkdir -p /catalogue-data/lucene
mkdir -p /editor-catalogue-data/lucene
mkdir -p /internal-catalogue-data/lucene
mkdir -p /map-catalogue-data/lucene

sed "s#USERNAME#$USERNAME#g" -i /jdbc.properties
sed "s#PASSWORD#$PASSWORD#g" -i /jdbc.properties
sed "s#DATABASE#$DATABASE#g" -i /jdbc.properties
sed "s#HOST#$HOST#g" -i /jdbc.properties

cp /jdbc.properties /catalogue-data/jdbc.properties
cp /jdbc.properties /editor-catalogue-data/jdbc.properties
cp /jdbc.properties /internal-catalogue-data/jdbc.properties
cp /jdbc.properties /map-catalogue-data/jdbc.properties

#rm -rf /usr/local/tomcat/webapps/*
#mv /target/$CATALOGUE.war /usr/local/tomcat/webapps

exec catalina.sh run "$@"

