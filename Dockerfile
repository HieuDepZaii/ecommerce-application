# Use the official OpenJDK 11 image with JDK as the base image for the builder stage
FROM openjdk:11 AS builder

# Set the working directory in the container
WORKDIR /app

# Install Maven
RUN apt-get update && apt-get install -y maven

# Copy the Maven project files to the container
COPY . /app

# Build the Maven project
RUN mvn -B -DskipTests clean package

# Use a smaller image for runtime
FROM openjdk:11-jre

# Set the working directory in the container
WORKDIR /app

# Copy the built JAR file from the builder stage to the runtime image
COPY --from=builder /app/target/*.jar /app/ecommerce-application.jar

# Set the entry point for the container to run the Java application
ENTRYPOINT ["java", "-jar", "ecommerce-application.jar"]
