# poc-spring-boot

## Centralized Configuration

Run `docker-compose up --build`

### Browse demo application

http://localhost:8080/message

This application read configuration value from Spring Cloud Config Server

### Update confguration

1. Update config value in "config/a-bootiful-client.properties" e.g. `message = Hello world again!`
2. Commit the changes as we use `spring.cloud.config.server.git.uri` (Git Backend) for the configuration


### Reload configuration of the demo application

`curl localhost:8080/actuator/refresh -d {} -H "Content-Type: application/json"`

If succeeded the output of `curl` will be `["config.client.version","message"]%`

See changes on http://localhost:8080/message

## TODO

- Use Vault Backend https://cloud.spring.io/spring-cloud-config/reference/html/#vault-backend
- Explore `Spring Boot Actuator` for configuration reload https://docs.spring.io/spring-boot/docs/current/reference/html/actuator.html
