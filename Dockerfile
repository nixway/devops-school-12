FROM maven:3.6.3-openjdk-11 AS build

RUN apt install git -y
RUN git clone https://github.com/shephertz/App42PaaS-Java-MySQL-Sample.git /build
WORKDIR /build
COPY ./Config.properties ./WebContent/
RUN mvn package

FROM tomcat:jre8-alpine
WORKDIR /usr/local/tomcat/webapps
COPY --from=build /build/target/App42PaaS-Java-MySQL-Sample-0.0.1-SNAPSHOT.war ./App43PaaS.war
