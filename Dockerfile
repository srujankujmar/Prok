FROM maven:3.6.3-jdk-11 as base
COPY . .
RUN mvn clean install
FROM openjdk:11.0.11-jre-slim-buster
COPY --from=base /target/*.jar  /usr/local/bin/
ENTRYPOINT ["java","-jar","/usr/local/bin/simplecurdoperations*.jar"]
