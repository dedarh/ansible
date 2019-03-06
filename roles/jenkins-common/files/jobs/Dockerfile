
FROM java:8
EXPOSE 8080

ADD wait.sh /root/wait.sh
ADD conf.sh /root/conf.sh

RUN sh /root/configure.sh

ENTRYPOINT ["java","-jar", "/root/jenkins.war"]





