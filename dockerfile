FROM centos:7

MAINTAINER ktianc ktianc2000@163.com

RUN yum -y install wget

WORKDIR /usr/local/

RUN wget http://www.ktianc.top/pag/centos7/jdk-8u221-linux-x64.tar.gz

RUN wget http://www.ktianc.top/pag/centos7/tomcat8.5.tar.gz

RUN tar -zxvf tomcat8.5.tar.gz

RUN tar -zxvf jdk-8u221-linux-x64.tar.gz

ENV JAVA_HOME=/usr/local/jdk1.8.0_221

ENV CLASSPATH=.:$JAVA_HOME/jre/lib/rt.jar:$JAVA_HOME/lib/dt.jar:$JAVA_HOME/lib/tools.jar

ENV PATH=$PATH:$JAVA_HOME/bin

WORKDIR /usr/local/apache-tomcat-8.5.24

RUN rm -rf conf/server.xml

COPY server.xml conf/server.xml

COPY /usr/local/tomcat/test2/target/abc.war webapps/abc.war

EXPOSE 8080/tcp

CMD ["/usr/local/apache-tomcat-8.5.24/bin/catalina.sh","run"]
