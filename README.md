###Features
pip install python-consul
pip install requests


### Editor.md

sudo ansible-playbook -i inventory/hosts jenkins.yml
go build -o server ./server.go
sudo consul agent -dev -bind=127.0.0.1 -client=0.0.0.0  -config-dir /etc/consul.d -ui -enable-script-checks

###Sequence Diagram
                    
```seq
Note right of Ansible: install\configure
Ansible->Jenkins Host:
Ansible->App Host:
Ansible->Docker Host:
Ansible->Consul Host:
Ansible->Cockroachdb Host:
Consul Host-->Jenkins Host: check state 
Consul Host-->App Host: check state 
Consul Host-->Docker Host: check state and  check student task
Consul Host-->Cockroachdb Host: check state 
Jenkins Host-->App Host: update/run app 
App Host-->Docker Host: run practic tast 
App Host-->Cockroachdb Host: select update insert
Docker Host-->Consul Host: select task for student
Docker Host-->Docker Host: run Docker console for student
```
                    
###End
sequenceDiagram
    participant A as Alice
    participant J as John
    A->>J: Hello John, how are you?
    J->>A: Great!
