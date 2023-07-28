# This file is available under the following license:
# under LGPL 2.1 (LICENSE.TXT) Copyright 2023 Torsten Friebe <tfr@users.sourceforge.net>
FROM tomcat:9-jdk11

LABEL maintainer="deegree TMC <tmc@deegree.org>"

# set deegree version
ARG DEEGREE_VERSION=3.5.0
ENV DEEGREE_WORKSPACE_ROOT=/root/.deegree
ENV CATALINA_OPTS="-Djavax.xml.transform.TransformerFactory=net.sf.saxon.TransformerFactoryImpl -Dlog.dir=$CATALINA_HOME/logs"

WORKDIR /usr/local/tomcat/webapps/
# download deegree webservices WAR file
RUN curl https://repo.deegree.org/content/repositories/public/org/deegree/deegree-webservices/${DEEGREE_VERSION}/deegree-webservices-${DEEGREE_VERSION}.war -o /usr/local/tomcat/webapps/deegree-webservices.war && \
    curl https://repo.deegree.org/content/repositories/public/org/deegree/deegree-tools-gml/${DEEGREE_VERSION}/deegree-tools-gml-${DEEGREE_VERSION}.jar -o /opt/deegree-tools-gml.jar

EXPOSE 8080
# run tomcat
CMD ["catalina.sh", "run"]