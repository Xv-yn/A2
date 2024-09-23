FROM openjdk:17-jdk-alpine

WORKDIR /app

COPY gradlew /app/gradlew
COPY gradle /app/gradle
COPY app/build.gradle /app/build.gradle
COPY settings.gradle /app/settings.gradle

COPY app /app/app

RUN chmod +x gradlew

RUN ./gradlew build

EXPOSE 8081

CMD ["java", "-jar", "./app/build/libs/app.jar"]