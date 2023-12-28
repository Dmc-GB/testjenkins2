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
        stage('cat some file') {
            steps {
                sh 'cat /home/mariano/Documents/Priv/Dockerfiles/Dockerfile'
            }
        }
    }
}
