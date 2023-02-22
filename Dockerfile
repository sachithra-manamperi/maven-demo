# Stage 1: Build the app using OpenJDK 8 on Alpine
# Use an official Java runtime as the base image
FROM openjdk:8-jdk-alpine as builder

# Set the working directory in the container
WORKDIR /app

# Copy the project files to the container
COPY . /app

# Install Gradle and build the project
RUN ./mvn clean install
RUN ./mvn test

# List artifacts to see the name of the jar file
RUN ls -l build/libs/



# Stage 2: Make the artifact
FROM openjdk:8-alpine
WORKDIR /app
COPY --from=builder /app/build/libs/devops-integration.jar .
CMD ["java", "-jar", "devops-integration.jar"]
