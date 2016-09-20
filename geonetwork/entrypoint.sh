#!/bin/bash
set -e

sed "s#USERNAME#$USERNAME#g" -i /jdbc.properties
sed "s#PASSWORD#$PASSWORD#g" -i /jdbc.properties
sed "s#DATABASE#$DATABASE#g" -i /jdbc.properties
sed "s#HOST#$HOST#g" -i /jdbc.properties

rm /usr/local/tomcat/webapps/*
mv target/$CATALOGUE.war /usr/local/tomcat/webapps

#catalina.sh run
