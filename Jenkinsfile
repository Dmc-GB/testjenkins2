pipeline {
    agent any
    environment {
        dockerImage = ""
    }
    stages {
        stage('Build') {
            steps {
                script {
                    def dockerImage = docker.build "cleopatra-frontend:v${env.BUILD_NUMBER}"
                }
            }
        }
        stage('Save') {
            steps {
                sh "docker save cleopatra-frontend:v${env.BUILD_NUMBER} -o cleopatra-frontend.tar"
            }
        }
    }
}
