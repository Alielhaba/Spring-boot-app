    FROM gradle:7.6.0-jdk11-alpine AS build

    WORKDIR /build-jar
    COPY . /build-jar
    RUN gradle build

    FROM openjdk:11-jre-slim

    RUN mkdir /app

    COPY --from=build /build-jar/build/libs/*.jar /app/spring-boot-application.jar

    RUN chmod 777 /app/spring-boot-application.jar

    EXPOSE 8080

    CMD ["java", "-jar", "/app/spring-boot-application.jar"]
