
FROM maven:3.8.4-openjdk-17 as build

COPY src /trinhlam/spring-mvc/src
COPY pom.xml /trinhlam/spring-mvc

WORKDIR /trinhlam/spring-mvc


RUN mvn clean package -DskipTests


FROM openjdk:17-slim



COPY --from=build /trinhlam/spring-mvc/target/*.war /trinhlam/spring-mvc/app.war

EXPOSE 8080

ENTRYPOINT ["java", "-jar", "/trinhlam/spring-mvc/app.war"]