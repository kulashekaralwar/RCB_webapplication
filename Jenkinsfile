pipeline {
    agent any

    tools{
        maven 'maven'
    }

    stages{
        stage('build'){
            steps{
                sh 'mvn clean package'
            }
        }
        stage('a'){
            steps{
                sh 'sudo docker build -t app /var/lib/jenkins/workspace/Chandu/'
            }
        }
        stage('tag'){
            steps{
                sh 'docker tag app kulashekaralwarn/app'
            }
        }
        stage('push to dockerhub'){
            steps{
                sh 'echo "@docker#123" | docker login -u "kulashekaralwarn" --password-stdin'
                sh 'docker push kulashekaralwarn/app'
            }
        }
        stage('check'){
            steps{
                script{
                    def containerExists = sh(script: "docker ps -q -f name=chandu", returnStdout: true).trim()
                    if (containerExists) {
                    sh "docker stop chandu"
                    sh "docker rm chandu"
                    }
                }
            }
        }
        stage('remove'){
            steps{
                sh 'docker rmi -f $(docker images -q)'
            }
        }
        stage('pull'){
            steps{
                sh 'docker pull kulashekaralwarn/app'
            }
        }
        stage('run'){
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
            sh 'docker rm -f chandu
        }
        always{
            echo 'Deployed'
        }
    }

}
