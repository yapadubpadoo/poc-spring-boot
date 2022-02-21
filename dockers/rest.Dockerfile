FROM openjdk:15-slim-buster as builder
COPY ./gs-rest-service-main /usr/src/myapp

WORKDIR /usr/src/myapp/complete
RUN ./gradlew build

FROM openjdk:15 as application-runner

COPY --from=builder /usr/src/myapp/complete/build/libs /usr/src/myapp
WORKDIR /usr/src/myapp/
CMD ["java", "-jar", "rest-service-0.0.1-SNAPSHOT.jar"] 