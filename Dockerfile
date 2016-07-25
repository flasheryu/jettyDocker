FROM java:8

# Install maven
RUN apt-get -y update
RUN apt-get install -y maven

WORKDIR /code

# Prepare by downloading dependencies
ADD pom.xml /code/pom.xml
#RUN ["mvn", "dependency:resolve"]
#RUN ["mvn", "verify"]

# Adding source, compile and package into a fat jar
#ADD hello-world-0.1-SNAPSHOT-jar-with-dependencies.jar /code/hello-world-0.1-SNAPSHOT-jar-with-dependencies.jar
ADD src /code/src
RUN ["mvn", "package"]

CMD ["java", "-jar", "target/hello-world-0.1-SNAPSHOT-jar-with-dependencies.jar"]