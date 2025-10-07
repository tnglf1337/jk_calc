# ===========================
# 🐋 Runtime-Image mit Temurin 17 JRE
# ===========================
FROM eclipse-temurin:17-jre

# Arbeitsverzeichnis im Container
WORKDIR /app

# Kopiere nur das fertige Jar aus deinem lokalen target-Ordner
COPY target/*.jar app.jar

# Startbefehl
ENTRYPOINT ["java", "-jar", "app.jar"]
