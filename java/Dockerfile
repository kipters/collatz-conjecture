ARG JAVA_VERSION=27
FROM eclipse-temurin:${JAVA_VERSION}-jdk AS build
ARG MAVEN_VERSION=3.10.2
ADD https://downloads.apache.org/maven/maven-3/${MAVEN_VERSION}/binaries/apache-maven-${MAVEN_VERSION}-bin.tar.gz /tmp/maven.tar.gz
RUN tar -xzf /tmp/maven.tar.gz -C /opt && \
    ln -s /opt/apache-maven-${MAVEN_VERSION}/bin/mvn /usr/local/bin/mvn && \
    rm /tmp/maven.tar.gz
COPY java /src
WORKDIR /src
RUN mvn clean compile assembly:single

FROM eclipse-temurin:${JAVA_VERSION}-jre
COPY --from=build /src/target/collatz-1.0-SNAPSHOT-jar-with-dependencies.jar /app/collatz.jar
ENTRYPOINT [ "java", "-jar", "/app/collatz.jar" ]
