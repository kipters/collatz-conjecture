FROM maven:3.9.7-eclipse-temurin-21 AS build
COPY java /src
WORKDIR /src
RUN mvn clean compile assembly:single

FROM eclipse-temurin:21-jre
COPY --from=build /src/target/collatz-1.0-SNAPSHOT-jar-with-dependencies.jar /app/collatz.jar
ENTRYPOINT [ "java", "-jar", "/app/collatz.jar" ]
