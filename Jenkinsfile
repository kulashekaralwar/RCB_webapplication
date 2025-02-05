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
        stage('build image'){
            steps{
                sh 'docker build -t app /var/lib/jenkins/workspace/dockerisedcontainer/'
            }
        }
        stage('build image'){
            steps{
                sh 'docker build -t app /var/lib/jenkins/workspace/dockerisedcontainer/'
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
        stage('remove'){
            steps{
                sh 'docker pull app'
            }
        }
        stage('remove'){
            steps{
                sh 'docker run -it -d --name chandu -p 8081 app'
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
