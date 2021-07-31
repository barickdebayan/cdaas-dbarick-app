FROM openjdk:8-jdk-alpine AS builder
LABEL stage=builder
WORKDIR /app
ADD ./ /app/
RUN cd /app
RUN export MAVEN_OPTS="-DsocksProxyHost=172.30.180.23 -DsocksProxyPort=8080" && ./mvnw clean install spring-boot:repackage

FROM openjdk:8-jdk-alpine
WORKDIR /app
COPY --from=builder /app/target/cdaas-demo-app-*.jar app.jar
EXPOSE 8080
ENTRYPOINT [ "java", "-jar", "/app/app.jar" ]
