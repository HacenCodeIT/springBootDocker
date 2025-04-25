FROM openjdk:21
EXPOSE 8080
ADD target/springbootDocker.jar springbootDocker.jar
ENTRYPOINT ["java","-jar","/springbootDocker.jar"]