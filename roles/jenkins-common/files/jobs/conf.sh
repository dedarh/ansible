
set -ex
wget -P /root/  http://mirrors.jenkins.io/war/2.122/jenkins.war
java  -jar /root/jenkins.war &

sh ~/wait.sh

sleep 60s
curl -o /root/jenkins-cli.jar -fsSL localhost:8080/jnlpJars/jenkins-cli.jar \
 && chmod a+x /root/jenkins-cli.jar

echo 'jenkins.model.Jenkins.instance.securityRealm.createAccount("dedarh", "dedarh")' | java -jar /root/jenkins-cli.jar -auth admin:$(cat /root/.jenkins/secrets/initialAdminPassword) -s http://localhost:8080/ groovy =
java -jar /root/jenkins-cli.jar -s http://localhost:8080 -auth dedarh:dedarh install-plugin job-dsl
java -jar /root/jenkins-cli.jar -s http://localhost:8080 -auth dedarh:dedarh  safe-restart

