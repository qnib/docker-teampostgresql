FROM qnib/nginx
MAINTAINER "Christian Kniep <christian@qnib.org>"

## 
RUN cd /opt/ && wget -q http://cdn.webworks.dk/download/teampostgresql_multiplatform.zip && \
    unzip teampostgresql_multiplatform.zip && rm -f teampostgresql_multiplatform.zip
RUN yum install -y java-1.8.0-openjdk
RUN sed -i -e "s#127.0.0.1#psql.service.consul#" /opt/teampostgresql/webapp/WEB-INF/teampostgresql-config.xml
ADD etc/supervisord.d/teampostgresql.ini /etc/supervisord.d/teampostgresql.ini
