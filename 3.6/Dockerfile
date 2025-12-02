# This file is available under the following license:
# under LGPL 2.1 (LICENSE.TXT) Copyright 2025 Torsten Friebe <tfr@users.sourceforge.net>
FROM tomcat:10-jdk17

ARG BUILD_DATE
ARG VCS_REF
ARG VCS_URL
LABEL maintainer="deegree TMC <tmc@deegree.org>" \
  org.opencontainers.image.created=$BUILD_DATE \
  org.opencontainers.image.source=$VCS_URL \
  org.opencontainers.image.revision=$VCS_REF

# set deegree version
ARG DEEGREE_VERSION=3.6.4

# API key to use; if empty will not change API key
ENV DEEGREE_API_KEY=
# console password to use; if empty not effective
ENV DEEGREE_CONSOLE_PWD=
# deegree workspace folder
ENV DEEGREE_WORKSPACE_ROOT=/root/.deegree
ENV CATALINA_OPTS="-Djavax.xml.transform.TransformerFactory=net.sf.saxon.TransformerFactoryImpl -Dlog.dir=$CATALINA_HOME/logs"
ENV JAVA_OPTS="--add-opens java.base/java.lang=ALL-UNNAMED --add-opens java.desktop/com.sun.imageio.spi=ALL-UNNAMED --add-opens java.desktop/javax.imageio.spi=ALL-UNNAMED --add-exports java.desktop/sun.awt=ALL-UNNAMED --add-exports java.desktop/com.sun.imageio.spi=ALL-UNNAMED --add-exports java.desktop/sun.swing=ALL-UNNAMED --add-opens java.desktop/javax.imageio.spi=ALL-UNNAMED"
ENV LANG=en_US.UTF-8

WORKDIR /usr/local/tomcat/webapps/
# download deegree webservices WAR file
RUN curl https://repo.deegree.org/repository/public/org/deegree/deegree-webservices/${DEEGREE_VERSION}/deegree-webservices-${DEEGREE_VERSION}.war -o /usr/local/tomcat/webapps/deegree-webservices.war && \
    curl https://repo.deegree.org/repository/public/org/deegree/deegree-tools-gml/${DEEGREE_VERSION}/deegree-tools-gml-${DEEGREE_VERSION}.jar -o /opt/deegree-tools-gml.jar

VOLUME $DEEGREE_WORKSPACE_ROOT
WORKDIR $DEEGREE_WORKSPACE_ROOT

#tomcat port
EXPOSE 8080
# apply apikey, password and run tomcat
CMD ([ -z "$DEEGREE_API_KEY" ] || (echo $DEEGREE_API_KEY > $DEEGREE_WORKSPACE_ROOT/config.apikey)) \
 && ([ -z "$DEEGREE_CONSOLE_PW" ] || (openssl passwd -5 $DEEGREE_CONSOLE_PW > $DEEGREE_WORKSPACE_ROOT/console.pw)) \
 && /usr/local/tomcat/bin/catalina.sh run