FROM azul/zulu-openjdk:21-jre
LABEL authors="kuanskchen344"
COPY target/configserver-0.0.1-SNAPSHOT.jar configserver-0.0.1-SNAPSHOT.jar
RUN apt-get update && apt-get install -y --no-install-recommends openssh-client ca-certificates
RUN apt-get install -y --no-install-recommends curl && rm -rf /var/lib/apt/lists/*
RUN mkdir -p /root/.ssh && chmod 700 /root/.ssh && ssh-keyscan -t rsa,ecdsa,ed25519 github.com >> /root/.ssh/known_hosts && chmod 644 /root/.ssh/known_hosts
ENTRYPOINT ["java", "-jar", "configserver-0.0.1-SNAPSHOT.jar"]