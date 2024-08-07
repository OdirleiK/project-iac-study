# Etapa 1: Construir o JAR usando Maven
FROM maven:3.8.6-openjdk-21 AS build
WORKDIR /app
COPY . .
RUN mvn clean package -DskipTests

# Etapa 2: Configurar o ambiente de execução
FROM openjdk:21
WORKDIR /app
COPY --from=build /app/target/project-iac-study-0.0.1-SNAPSHOT.jar app.jar
EXPOSE 8080

ENTRYPOINT ["java", "-jar", "app.jar"]