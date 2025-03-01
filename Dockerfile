FROM maven:3.8.8-openjdk-17 AS builder

WORKDIR /app
# 首先只复制pom.xml，利用Docker缓存机制
COPY app/server/pom.xml ./pom.xml
COPY app/server/.mvn ./.mvn
COPY app/server/mvnw ./mvnw
COPY app/server/mvnw.cmd ./mvnw.cmd

# 预下载所有依赖
RUN ./mvnw dependency:go-offline -B

# 然后复制源代码
COPY app/server/src ./src

# 打包应用
RUN ./mvnw package -DskipTests

FROM eclipse-temurin:17-jre

WORKDIR /app
COPY --from=builder /app/target/*.jar /app/app.jar

ENV TZ=Asia/Shanghai

EXPOSE 8080

# 添加健康检查
HEALTHCHECK --interval=30s --timeout=30s --start-period=5s --retries=3 \
  CMD curl -f http://localhost:8080/actuator/health || exit 1

ENTRYPOINT ["java", "-jar", "/app/app.jar"]
