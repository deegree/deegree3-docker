# This file is available under the following license:
# under LGPL 2.1 (LICENSE.TXT) Copyright 2025 Torsten Friebe <tfr@users.sourceforge.net>
FROM tomcat:9-jdk8

LABEL maintainer="deegree TMC <tmc@deegree.org>"

# set deegree version
ENV DEEGREE_VERSION=3.4.35
ENV CATALINA_OPTS="-Djavax.xml.transform.TransformerFactory=net.sf.saxon.TransformerFactoryImpl"

EXPOSE 8080

# download deegree webservices WAR file
RUN curl https://repo.deegree.org/content/repositories/public/org/deegree/deegree-webservices/${DEEGREE_VERSION}/deegree-webservices-${DEEGREE_VERSION}.war -o /usr/local/tomcat/webapps/deegree-webservices.war

# download deegree tools command line interface
RUN curl https://repo.deegree.org/content/repositories/public/org/deegree/deegree-tools-gml/${DEEGREE_VERSION}/deegree-tools-gml-${DEEGREE_VERSION}.jar -o /opt/deegree-tools-gml.jar

# run tomcat
CMD ["catalina.sh", "run"]