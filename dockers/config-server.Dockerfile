FROM openjdk:15-slim-buster as builder

COPY ./gs-centralized-configuration-main /usr/src/myapp

WORKDIR /usr/src/myapp/complete
RUN ./gradlew build

FROM openjdk:15 as application-runner

COPY --from=builder /usr/src/myapp/complete/configuration-service/build/libs /usr/src/myapp
WORKDIR /usr/src/myapp
CMD ["java", "-jar", "configuration-service-0.0.1-SNAPSHOT.jar"] 