pipeline {
    agent {
        docker {
            image 'node:14' // Use a Node.js image as the base image
            args '-v /var/run/docker.sock:/var/run/docker.sock' // Mount the Docker socket to allow Docker commands inside the container
        }
    }

    stages {
        stage('Clone repository') {
            steps {
                checkout scm
            }
        }

        stage('Build Node.js image') {
            steps {
                script {
                    // Build the Docker image
                    docker.build("your-dockerhub-username/nodejs-app:${env.BUILD_ID}")
                }
            }
        }
    }
}
