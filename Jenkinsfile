pipeline {
    agent any

    tools{
        maven 'maven'
    }

    stages{
        stage('chandu code'){
            steps{
                git branch: 'main', url: 'https://github.com/chandukulashekar/RCB_webapplication.git'
            }
        }
        stage('build'){
            steps{
                sh 'mvn clean package'
            }
        }
        stage('a'){
            steps{
                sh 'sudo docker build -t app .'
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
        stage('remove'){
            steps{
                sh 'docker rmi app'
            }
        }
        stage('pull'){
            steps{
                sh 'echo "@docker#123" | docker login -u "kulashekaralwarn" --password-stdin'
                sh 'docker pull kulashekaralwarn/app'
            }
        }
        stage('run'){
            steps{
                sh 'docker run -it -d --name chandu -p 8081:8080 kulashekaralwarn/app:latest'
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
        always{
            echo 'Deployed'
        }
    }

}
