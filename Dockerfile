# Use the latest version of Alpine
FROM alpine:latest

# Install required dependencies
RUN apk --no-cache add ca-certificates

# Set environment variables for Java version and download URL
ARG JAVA_VERSION=21.0.1_12
ARG JAVA_URL=https://github.com/adoptium/temurin21-binaries/releases/download

# Download and install the latest version of Eclipse Temurin
RUN set -eux; \
    wget -O openjdk.tar.gz "$JAVA_URL/jdk-21.0.1%2B12/OpenJDK21U-jre_x64_alpine-linux_hotspot_$JAVA_VERSION.tar.gz"; \
    tar -xzf openjdk.tar.gz; \
    mv jdk-21* /opt/java; \
    rm openjdk.tar.gz

# Set JAVA_HOME environment variable
ENV JAVA_HOME=/opt/java
# Add Java binary to PATH
ENV PATH="${JAVA_HOME}/bin:${PATH}"

# Check if Java is installed correctly
RUN java -version
