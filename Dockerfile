FROM maven:3.8.4-openjdk-8 AS build
WORKDIR /app
RUN git clone https://github.com/Bhargavi-lakamsani/maven-jar-sample.git
WORKDIR /app/maven-jar-sample
RUN mvn clean install

FROM openjdk:8-jre-alpine
WORKDIR /app
COPY --from=build /app/maven-jar-sample/target/*.jar /app/app.jar
EXPOSE 8080
CMD ["java", "-jar", "/app/app.jar"]
