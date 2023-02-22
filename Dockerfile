# Stage 1: Build the app using Maven and OpenJDK 8 on Alpine
# Use an official Maven image with Java runtime as the base image
FROM maven:3-jdk-8-alpine as builder

# Set the working directory in the container
WORKDIR /app

# Copy the project files to the container
COPY . /app

# Build the application using Maven
RUN mvn clean install
RUN mvn test

# List artifacts to see the name of the jar file
RUN ls -l target/

# Stage 2: Make the artifact
FROM openjdk:8-alpine
WORKDIR /app
COPY --from=builder /app/target/devops-integration.jar .
CMD ["java", "-jar", "devops-integration.jar"]
