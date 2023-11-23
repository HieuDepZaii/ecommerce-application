# Use the official Eclipse Temurin 17 JDK image as the base image
FROM eclipse-temurin:17-jre-jammy AS builder

# Set the working directory in the container
WORKDIR /app

# Copy the Maven project files to the container
COPY . /app

# Build the Maven project
RUN mvn -B -DskipTests clean package

# Use a new minimal image for runtime
FROM eclipse-temurin:17-jre-jammy

# Set the working directory in the container
WORKDIR /app

# Copy the built JAR file from the builder stage to the runtime image
COPY --from=builder /app/target/*.jar /app/ecommerce-application.jar

# Set the entry point for the container to run the Java application
ENTRYPOINT ["java", "-jar", "ecommerce-application.jar"]
