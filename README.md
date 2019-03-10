sudo ansible-playbook -i inventory/hosts jenkins.yml
 go build -o server ./server.go


sudo consul agent -dev -bind=127.0.0.1 -client=0.0.0.0  -config-dir /etc/consul.d -ui -enable-script-checks

