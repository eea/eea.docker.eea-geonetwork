FROM tomcat:7.0-jre8

MAINTAINER michimau <mauro.michielon@eea.europa.eu>

RUN wget http://files.titellus.net/geonetwork/eea/eea-catalogues-3.2.x.tar.gz -O eea-catalogues.tar.gz

RUN tar -xvzf eea-catalogues.tar.gz

COPY jdbc.properties /jdbc.properties
COPY entrypoint.sh /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]

EXPOSE 8080
