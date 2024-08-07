# Etapa 1: Construir o JAR usando Maven
FROM maven:3.9.8 AS build
WORKDIR /app

# Copiar apenas o pom.xml e o diretório de dependências para cache
COPY pom.xml .
COPY src ./src

# Baixar as dependências (se houver mudanças no pom.xml, as dependências serão atualizadas)
RUN mvn dependency:go-offline

# Copiar o restante do código
COPY . .

# Construir o JAR
RUN mvn clean package -DskipTests

# Etapa 2: Configurar o ambiente de execução
FROM openjdk:21
WORKDIR /app
COPY --from=build /app/target/project-iac-study-0.0.1-SNAPSHOT.jar app.jar
EXPOSE 8080

ENTRYPOINT ["java", "-jar", "app.jar"]
