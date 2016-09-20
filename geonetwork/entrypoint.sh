#!/bin/bash
set -e

sed "s#USERNAME#$USERNAME#g" -i /jdbc.properties
sed "s#PASSWORD#$PASSWORD#g" -i /jdbc.properties
sed "s#DATABASE#$DATABASE#g" -i /jdbc.properties
sed "s#HOST#$HOST#g" -i /jdbc.properties

rm -rf /usr/local/tomcat/webapps/*
mv target/$CATALOGUE.war /usr/local/tomcat/webapps

exec catalina.sh run "$@"

