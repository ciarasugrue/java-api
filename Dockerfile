FROM maven:latest
WORKDIR /code
COPY . /code
GIT
EXPOSE 8080

ARG DB_HOST
ENV DB_HOST ${DB_HOST}
ARG DB_PASSWORD ${DB_PASSWORD}
ARG DB_USERNAME ${DB_USERNAME}
ARG DB_NAME ${DB_NAME}

RUN mvn clean install -DskipTests=true
CMD ["java","-jar", "/code/target/JavaWebService-1.0-SNAPSHOT.jar", "server", "/code/config.yml"]

