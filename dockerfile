FROM openjdk:16-jdk-alpine
RUN addggroup -S spring && adduser -S spring -G spring
COPY ${DEPENDENCY}/BOOT-INF/lib /app/lib
COPY ${DEPENDENCY}/META-INF /app/META-INF
COPY ${DEPENDENCY}/BOOT-INF/lib /app/lib

ENTRYPOINT [ "java", "-Dspring.profiles.active=${JAVA_PROFILE}" ,\
            "-ep","app:app/lib/*","camt.se234.lab10.Lab10Application" ]