pipeline {
    agent {
        node {
            label 'jenkins-agent' // Ou utilisez le nom de l'agent à la place du label
        }
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
                    // Construire l'image Docker
                    docker.build("your-dockerhub-username/nodejs-app:${env.BUILD_ID} .")
                }
            }
        }
    }
}
