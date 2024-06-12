FROM openjdk:8-jdk-alpine
COPY --from=build /home/app/target/*.jar /app.jar
EXPOSE 8080
ENTRYPOINT ["java","jar","/app.jar"]
