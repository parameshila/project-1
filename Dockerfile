FROM tomcat:8.0
COPY index.html  /usr/local/tomcat/webapps/Root/index.html
ENV JAVA_HOME=/usr/bin/java
WORKDIR /usr/local/tomcat/webapps
USER  root
EXPOSE 8080
CMD ['catalina.sh','run']
