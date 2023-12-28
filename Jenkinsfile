pipeline {
    agent {
        label 'jenkins-agent'
    }

    stages {
        stage('Clone repository') {
            steps {
                checkout scm
            }
        }

        stage('Build Node.js Docker Image') {
            steps {
                script {
                    // Build Docker image
                    docker.build("your-dockerhub-username/nodejs-app:${env.BUILD_ID} .")
                }
            }
        }
    }
}
