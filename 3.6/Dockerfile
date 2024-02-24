# This file is available under the following license:
# under LGPL 2.1 (LICENSE.TXT) Copyright 2024 Torsten Friebe <tfr@users.sourceforge.net>
FROM tomcat:10-jdk17

ARG BUILD_DATE
ARG VCS_REF
ARG VCS_URL
LABEL maintainer="deegree TMC <tmc@deegree.org>" \
  org.opencontainers.image.created=$BUILD_DATE \
  org.opencontainers.image.source=$VCS_URL \
  org.opencontainers.image.revision=$VCS_REF

# set deegree version
ARG DEEGREE_VERSION=3.6.0-SNAPSHOT
ENV DEEGREE_WORKSPACE_ROOT=/root/.deegree
ENV CATALINA_OPTS="-Djavax.xml.transform.TransformerFactory=net.sf.saxon.TransformerFactoryImpl -Dlog.dir=$CATALINA_HOME/logs"
ENV LANG en_US.UTF-8

WORKDIR /usr/local/tomcat/webapps/
# download deegree webservices WAR file
RUN curl https://repo.deegree.org/repository/snapshots/org/deegree/deegree-webservices/${DEEGREE_VERSION}/deegree-webservices-3.6.0-20240224.132340-1.war -o /usr/local/tomcat/webapps/deegree-webservices.war && \
    curl https://repo.deegree.org/repository/snapshots/org/deegree/deegree-tools-gml/${DEEGREE_VERSION}/deegree-tools-gml-3.6.0-20240224.132340-1.jar -o /opt/deegree-tools-gml.jar

EXPOSE 8080
# run tomcat
CMD ["catalina.sh", "run"]