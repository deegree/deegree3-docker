# This file is available under the following license:
# under LGPL 2.1 (LICENSE.TXT) Copyright 2025 Torsten Friebe <tfr@users.sourceforge.net>
FROM tomcat:9-jdk11

ARG BUILD_DATE
ARG VCS_REF
ARG VCS_URL
LABEL maintainer="deegree TMC <tmc@deegree.org>" \
  org.opencontainers.image.created=$BUILD_DATE \
  org.opencontainers.image.source=$VCS_URL \
  org.opencontainers.image.revision=$VCS_REF

# set deegree version
ARG DEEGREE_VERSION=3.5.12
ENV DEEGREE_WORKSPACE_ROOT=/root/.deegree
ENV CATALINA_OPTS="-Djavax.xml.transform.TransformerFactory=net.sf.saxon.TransformerFactoryImpl -Dlog.dir=$CATALINA_HOME/logs"
ENV LANG en_US.UTF-8

WORKDIR /usr/local/tomcat/webapps/
# download deegree webservices WAR file
RUN curl https://repo.deegree.org/content/repositories/public/org/deegree/deegree-webservices/${DEEGREE_VERSION}/deegree-webservices-${DEEGREE_VERSION}.war -o /usr/local/tomcat/webapps/deegree-webservices.war && \
    curl https://repo.deegree.org/content/repositories/public/org/deegree/deegree-tools-gml/${DEEGREE_VERSION}/deegree-tools-gml-${DEEGREE_VERSION}.jar -o /opt/deegree-tools-gml.jar

EXPOSE 8080
# run tomcat
CMD ["catalina.sh", "run"]