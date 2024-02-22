# Stage 1: Java and Node Setup
FROM maven:3.9.6-eclipse-temurin-21 AS builder

WORKDIR /app/
COPY src src
COPY pom.xml .

RUN mvn package

# Stage 2: Final image
FROM eclipse-temurin:21.0.2_13-jre

WORKDIR /app
COPY --from=builder /app/target/harness-task-hello-world-0.0.1-SNAPSHOT.jar /app/harness-task-hello-world.jar

# Run the application
ENTRYPOINT ["java", "-jar", "/app/harness-task-hello-world.jar"]gi