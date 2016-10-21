#!/bin/bash
set -e

mkdir -p /catalogue-data/htmlcache
mkdir -p /catalogue-data/lucene
mkdir -p /internal-catalogue-data/htmlcache
mkdir -p /internal-catalogue-data/lucene
mkdir -p /editor-catalogue-data/htmlcache
mkdir -p /editor-catalogue-data/lucene
mkdir -p /map-catalogue-data/htmlcache
mkdir -p /map-catalogue-data/lucene

sed "s#USERNAME#$USERNAME#g" -i /jdbc.properties
sed "s#PASSWORD#$PASSWORD#g" -i /jdbc.properties
sed "s#HOST#$HOST#g" -i /jdbc.properties
sed "s#PORT#$PORT#g" -i /jdbc.properties

cp /jdbc.properties /jdbc_public.properties
cp /jdbc.properties /jdbc_internal.properties
cp /jdbc.properties /jdbc_editor.properties
cp /jdbc.properties /jdbc_map.properties

sed "s#DATABASE#$DATABASE_PUBLIC#g" -i /jdbc_public.properties
sed "s#DATABASE#$DATABASE_INTERNAL#g" -i /jdbc_internal.properties
sed "s#DATABASE#$DATABASE_EDITOR#g" -i /jdbc_editor.properties
sed "s#DATABASE#$DATABASE_MAP#g" -i /jdbc_map.properties

cp /jdbc_public.properties /catalogue-data/jdbc.properties
cp /jdbc_internal.properties /internal-catalogue-data/jdbc.properties
cp /jdbc_editor.properties /editor-catalogue-data/jdbc.properties
cp /jdbc_map.properties /map-catalogue-data/jdbc.properties

rm -rf /usr/local/tomcat/webapps/*
cp /target/*.war /usr/local/tomcat/webapps
echo all artifacts copied in webapps

exec catalina.sh run "$@"

