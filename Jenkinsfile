pipeline {
    agent any

    tools{
        maven 'maven'
    }

    stages{
        stage('Check and remove container'){
            steps{
                script{
                    def containerExists = sh(script: "docker ps -q -f name=chandu", returnStdout: true).trim()
                    if (containerExists) {
                    sh 'docker stop chandu'
                    sh 'docker rm chandu'
                    }
                }
            }
        }
        stage('Build package'){
            steps{
                sh 'mvn clean package'
            }
        }
        stage('Create image'){
            steps{
                sh 'sudo docker build -t app /var/lib/jenkins/workspace/Chandu/'
            }
        }
        stage('Assign tag'){
            steps{
                sh 'docker tag app kulashekaralwarn/app'
            }
        }
        stage('Push to dockerhub'){
            steps{
                sh 'echo "passwd" | docker login -u "usrname" --password-stdin'
                sh 'docker push kulashekaralwarn/app'
            }
        }
        stage('Remove images'){
            steps{
                sh 'docker rmi -f $(docker images -q)'
            }
        }
        stage('Pull image from DockerHub'){
            steps{
                sh 'docker pull kulashekaralwarn/app'
            }
        }
        stage('Run a container'){
            steps{
                sh 'docker run -it -d --name chandu -p 8081:8080 kulashekaralwarn/app'
            }
        }
    }
    post {
        success {
            echo 'Deployment successful'
        }
        failure {
            sh 'docker rm -f chandu'
        }
        always{
            echo 'Deployed'
        }
    }

}
