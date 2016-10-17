#!/bin/bash
set -e

if [ $DOWNLOAD = "YES" ]; then wget $URL -O /eea-catalogues.tar.gz && tar -xvzf /eea-catalogues.tar.gz -C /; fi
  
#wget $URL -O /eea-catalogues.tar.gz
#tar -xvzf /eea-catalogues.tar.gz -C /

if [ -z $CATALOGUE ]; then CATALOGUE='NO'; fi

#if [ $CATALOGUE='ALL' ]; then mv /target/*.war /usr/local/tomcat/webapps; else mv /target/$CATALOGUE.war /usr/local/tomcat/webapps; fi

case "$CATALOGUE" in
  "NO")  echo no deploy ;;
  "ALL") cp /target/*.war /usr/local/tomcat/webapps && echo all artifacts copied into webapps ;;
  *) cp /target/$CATALOGUE.war /usr/local/tomcat/webapps && echo $CATALOGUE.war artifact copied in webapps;;
esac

#rm -rf /usr/local/tomcat/webapps/*
#mv /target/$CATALOGUE.war /usr/local/tomcat/webapps

exec echo deploy.sh exit "$@"
