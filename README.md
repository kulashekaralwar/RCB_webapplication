Dockerized web application deployment
-------------------------------------------------------
update node
install java
install git
install docker
install jenkins
-------------------------------------------------------
configure jnekins
--> provide permissions for jenkins
visudo
jenkins ALL=(ALL) NOPASSWD: ALL

--> add docker user to jenkins
usermod -aG docker jenkins
--> check added or not 
groups jenkins
--> restart jenkins
systemctl restart jenkins

