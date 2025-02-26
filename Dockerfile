FROM tomcat:9-jre9
EXPOSE 8080
COPY ./target/RCB.war /usr/local/tomcat/webapps/ROOT.war
CMD ["catalina.sh","run"]
