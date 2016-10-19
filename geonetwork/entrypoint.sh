#!/bin/bash
set -e

mkdir -p /$CATALOGUE-data/htmlcache

mkdir -p /$CATALOGUE-data/lucene

sed "s#USERNAME#$USERNAME#g" -i /jdbc.properties
sed "s#PASSWORD#$PASSWORD#g" -i /jdbc.properties
sed "s#DATABASE#$DATABASE#g" -i /jdbc.properties
sed "s#HOST#$HOST#g" -i /jdbc.properties
sed "s#PORT#$PORT#g" -i /jdbc.properties

cp /jdbc.properties /$CATALOGUE-data/jdbc.properties

cp /target/$CATALOGUE.war /usr/local/tomcat/webapps 
echo $CATALOGUE.war artifact copied in webapps

exec catalina.sh run "$@"

