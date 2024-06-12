FROM maven:3.05-jdk-8-slim As build
COPY src /home/app/src
COPY pom.xml /home/app
RUN mvn -f /home/app/pom.xml clean test package
FROM openjdk:8-jdk-alpine
COPY --from=build /home/app/target/*.jar /app.jar
EXPOSE 8080
ENTRYPOINT ["java","jar","/app.jar"]
