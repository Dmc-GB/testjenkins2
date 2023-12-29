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
                    // Extraire la version actuelle de NGINX depuis le fichier docker-compose.yml
                    def currentNginxVersion = sh(script: "grep 'image: nginx:' ${dockerComposeFile} | cut -d ':' -f 3", returnStdout: true).trim()

                    // Construire l'image Docker avec la version actuelle
                    docker.build("nginx:${currentNginxVersion}")
                }
            }
        }
        stage('Update Docker Compose') {
            steps {
                script {
                    // Remplacer le tag de l'image dans docker-compose.yml
                    sh "sed -i 's#nginx:${currentNginxVersion}#nginx:${dockerImageTag}#' ${dockerComposeFile}"
                }
            }
        }
        stage('Deploy') {
            steps {
                script {
                    // Lancer docker-compose
                    sh "docker-compose -f ${dockerComposeFile} up -d"
                }
            }
        }
    }
}
