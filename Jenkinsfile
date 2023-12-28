pipeline {
    agent any

    stages {
        stage('Clone repository') {
            steps {
                checkout scm
            }
        }

        stage('Build Node.js Docker Image') {
            steps {
                script {
                    // Construire l'image Docker
                    docker.build("your-dockerhub-username/nodejs-app:${env.BUILD_ID} .")
                }
            }
        }
    }
}
