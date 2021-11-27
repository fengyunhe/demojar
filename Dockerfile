FROM openjdk:8-jdk-alpine
ARG JAR_FILE=target/*.jar
COPY ${JAR_FILE} /usr/local/app.jar
ENV JVM_OPTION=""
EXPOSE 8080
ENTRYPOINT java ${JVM_OPTION} -jar /usr/local/app.jar