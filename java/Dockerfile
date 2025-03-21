ARG JAVA_VERSION=23
FROM maven:3.9.9-eclipse-temurin-${JAVA_VERSION} AS build
COPY java /src
WORKDIR /src
RUN mvn clean compile assembly:single

FROM eclipse-temurin:${JAVA_VERSION}-jre
COPY --from=build /src/target/collatz-1.0-SNAPSHOT-jar-with-dependencies.jar /app/collatz.jar
ENTRYPOINT [ "java", "-jar", "/app/collatz.jar" ]
