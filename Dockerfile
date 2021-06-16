# This file is available under the following license:
# under LGPL 2.1 (LICENSE.TXT) Copyright 2020 Torsten Friebe <tfr@users.sourceforge.net>

FROM tomcat:8.5-jdk8

LABEL maintainer="deegree TMC <tmc@deegree.org>"

# set deegree version
ENV DEEGREE_VERSION=3.4.16
ENV CATALINA_OPTS="-Djavax.xml.transform.TransformerFactory=net.sf.saxon.TransformerFactoryImpl"

EXPOSE 8080

# download deegree webservices webapp
RUN wget http://repo.deegree.org/content/repositories/public/org/deegree/deegree-webservices/${DEEGREE_VERSION}/deegree-webservices-${DEEGREE_VERSION}.war -O /usr/local/tomcat/webapps/deegree-webservices.war

#download deegree tools command line interface
RUN wget http://repo.deegree.org/content/repositories/public/org/deegree/deegree-tools-config/${DEEGREE_VERSION}/deegree-tools-config-${DEEGREE_VERSION}-distribution.zip -O /tmp/deegree-tools-config.zip

RUN unzip /tmp/deegree-tools-config.zip -d /opt/ && \
    ln -s /opt/deegree-tools-config-${DEEGREE_VERSION}/ /opt/deegree-tools-config && \
    rm /tmp/deegree-tools-config.zip

# run tomcat
CMD ["catalina.sh", "run"]