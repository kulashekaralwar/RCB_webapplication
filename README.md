Configuration need to be done

Jenkins node
-----------------------------------------------
Install java

Install Jenkins

Install git


Tomcat node
-----------------------------------------------
Install java

Install tomcat

then configure
 
vi apache-tomcat-9.0.98/webapps/manager/META-INF/context.xml
<!--comment cookies till manager-->

vi apache-tomcat-9.0.98/conf/tomcat-users.xml

before last closing tag add

<role rolename="manager-gui"/>
<role rolename="manager-script"/>
<role rolename="manager-jmx"/>
<role rolename="manager-status"/>
<user username="admin" password="admin" roles="manager-gui, manager-script, manager-jmx, manager-status"/>

sh apache-tomcat-9.0.98/bin/startup.sh

passwd root
1234

vi /etc/ssh/sshd_config

uncomment PermitRootLogin yes & PasswordAuthentication yes
comment PasswordAuthentication no

systemctl restart sshd


Jenkins node
-----------------------------------------------

ssh-keygen -t rsa

ssh-copy-id -i ~/.ssh/id_rsa.pub root@172.31.6.91(private ip of tomcat)

ssh root@172.31.6.91(private ip of tomcat)  ---to check connection is working or not


Now get into Jenkins console

add one plugin --> "SSH Agent Plugin"   -->restart jenkins

create SSH Credentials

Dashboard--> Credentials --> Global credentials --> add

Kind: SSH Username with Private Key
ID: ANYTHING (remember to provide in pipeline)
Username: ANYTHING
Private Key:
	Select Enter directly

--> to get private key in the Jenkins node 
cat ~/.ssh/id_rsa     --->you will get private key now copy and paste in box

Save.
