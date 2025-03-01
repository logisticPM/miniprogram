FROM maven:3.8.8-openjdk-17 AS builder

WORKDIR /app
COPY . /app
RUN mvn clean package -DskipTests

FROM eclipse-temurin:17-jre

WORKDIR /app
COPY --from=builder /app/target/*.jar /app/app.jar

ENV TZ=Asia/Shanghai

EXPOSE 8080

ENTRYPOINT ["java", "-jar", "/app/app.jar"]
