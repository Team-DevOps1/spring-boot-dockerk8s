FROM openjdk:11-jre-slim
WORKDIR /app
COPY target/spring-boot-2-hello-world-1.0.2-SNAPSHOT.jar /app/app.jar
EXPOSE 8080
ENTRYPOINT ["java", "-jar", "/app/app.jar"]
