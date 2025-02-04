pipeline {
    agent any

    environment {
        TOMCAT_SERVER = 'root@172.31.6.91'   
        CREDENTIALS_ID = 'ssh'  
    }
    tools{
        maven 'maven'
    }

    stages {
        stage('Build with Maven') {
            steps {
                sh 'mvn clean package'
            }
        }

        stage('Transfer WAR to Tomcat') {
            steps {
                script {
                    sshagent([CREDENTIALS_ID]) {
                        sh """
                            scp -o StrictHostKeyChecking=no /var/lib/jenkins/workspace/Pip/target/RCB.war root@172.31.6.91:/root/apache-tomcat-9.0.98/webapps/
                            scp -r -o StrictHostKeyChecking=no /var/lib/jenkins/workspace/Pip/target/RCB root@172.31.6.91:/root/apache-tomcat-9.0.98/webapps/
                        """
                    }
                }
            }
        }

        stage('Restart Tomcat') {
            steps {
                script {
                    sshagent([CREDENTIALS_ID]) {
                        sh """
                            ssh -o StrictHostKeyChecking=no ${TOMCAT_SERVER} <<EOF
                            cd /root/apache-tomcat-9.0.98/bin
                            ./shutdown.sh
                            sleep 5
                            ./startup.sh
                        """
                    }
                }
            }
        }
    }

    post {
        success {
            echo 'Deployment successful'
        }
        failure {
            echo 'Deployment failed'
        }
    }
}
