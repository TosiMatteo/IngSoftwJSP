# Utilizzo come immagine base la openjdk 17
FROM openjdk:17-jdk-alpine
# Imposto come autori il gruppo
LABEL authors="Code Crusaders"
# Imposto la working directory dentro il container
WORKDIR /app
# Imposto una directory temporanea dentro il container
VOLUME /tmp

COPY build/libs/IngSw2024-jsp-only-0.0.1-SNAPSHOT.jar /app/app.jar

EXPOSE 8080

ENTRYPOINT ["java", "-jar", "/app/app.jar"]