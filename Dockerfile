FROM openjdk:8-jdk-alpine AS builder
LABEL stage=builder
WORKDIR /app
ADD ./ /app/
RUN cd /app
RUN export MAVEN_OPTS="-Dhttp.proxyHost=172.30.180.23 -Dhttp.proxyPort=8080 -Dhttps.proxyHost=172.30.180.23 -Dhttps.proxyPort=8080" && ./mvnw clean install spring-boot:repackage
#RUN export MAVEN_OPTS="-DsocksProxyHost=172.30.180.23 -DsocksProxyPort=8080" && ./mvnw clean install spring-boot:repackage

FROM openjdk:8-jdk-alpine
WORKDIR /app
COPY --from=builder /app/target/cdaas-demo-app-*.jar app.jar
EXPOSE 8080
ENTRYPOINT [ "java", "-jar", "/app/app.jar" ]
