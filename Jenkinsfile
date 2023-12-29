pipeline {
    agent any
    environment {
        NGINX_VERSION = ""  // Déclarer la variable ici
        dockerImageTag = "v${env.BUILD_NUMBER}"
        dockerComposeFile = "/home/FRONTEND/docker-compose.yml"
    }
    stages {
        stage('Build') {
            steps {
                script {
                    // Construire l'image Docker avec la version spécifiée
                    sh "NGINX_VERSION=${dockerImageTag} docker build -t nginx:${dockerImageTag} ."
                }
            }
        }
        stage('Update Docker Compose') {
            steps {
                script {
                    // Mise à jour de la variable NGINX_VERSION avec le tag de l'image
                    NGINX_VERSION = dockerImageTag
                    
                    // Remplacer le tag de l'image dans docker-compose.yml
                    sh "sed -i 's#nginx:${NGINX_VERSION}#nginx:${dockerImageTag}#' ${dockerComposeFile}"
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
