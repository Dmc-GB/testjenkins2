pipeline {
    agent any
    environment {
        dockerImageTag = "v${env.BUILD_NUMBER}"
        dockerComposeFile = "/home/FRONTEND/docker-compose.yml"
    }
    stages {
        stage('Build') {
            steps {
                script {
                    // Construire l'image Docker avec le tag spécifié
                    docker.build("nginx:${dockerImageTag}")
                }
            }
        }
        stage('Deploy') {
            steps {
                script {
                    // Remplacer le tag de l'image dans docker-compose.yml
                    sh "sed -i 's#nginx:latest#nginx:${dockerImageTag}#' ${dockerComposeFile}"

                    // Lancer docker-compose
                    sh "docker-compose -f ${dockerComposeFile} up -d"
                }
            }
        }
    }
}
