FROM openjdk:16-jdk-alpine
RUN addggroup -S spring && adduser -S spring -G spring
EXPOSE 8080
ENV JAVA_PROFILE prod
COPY ${DEPENDENCY}/BOOT-INF/lib /app/lib
COPY ${DEPENDENCY}/META-INF /app/META-INF
COPY ${DEPENDENCY}/BOOT-INF/classes /app

ENTRYPOINT [ "java", "-Dspring.profiles.active=${JAVA_PROFILE}" ,\
            "-cp","app:app/lib/*","camt.se234.lab10.Lab10Application" ]