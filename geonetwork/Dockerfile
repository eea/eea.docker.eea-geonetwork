FROM  tomcat:8-jre8

MAINTAINER michimau <mauro.michielon@eea.europa.eu>

ARG id

RUN apt-get -y update
#RUN apt-get -y install vim
RUN wget https://files.titellus.net/geonetwork/eea/eea-catalogues-$id.tar.gz -O eea-catalogues.tar.gz

RUN tar -xvzf eea-catalogues.tar.gz -C /

RUN sed -i 's/port="8080"/port="8080" URIEncoding="UTF-8"/' /usr/local/tomcat/conf/server.xml

COPY jdbc.properties /jdbc.properties

COPY entrypoint.sh /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
