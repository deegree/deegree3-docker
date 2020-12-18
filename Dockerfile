FROM tomcat:8.5-jre8

MAINTAINER deegree TMC <tmc@deegree.org>

# set deegree version
ENV DEEGREE_VERSION 3.4.14

EXPOSE 8080

# download deegree 
RUN wget http://repo.deegree.org/content/repositories/public/org/deegree/deegree-webservices/${DEEGREE_VERSION}/deegree-webservices-${DEEGREE_VERSION}.war -O /usr/local/tomcat/webapps/deegree-webservices.war

# run tomcat
CMD ["catalina.sh", "run"]
