pipeline {
    agent any
    environment {
        dockerImage = ""
    }
    stages {
        stage('Build') {
            steps {
                script {
                    // Construire l'image Docker et récupérer son nom
                    dockerImage = docker.build "cleopatra-frontend:v${env.BUILD_NUMBER}"
                }
            }
        }
        stage('Deploy') {
            steps {
                script {
                    // Remplacer le nom de l'image dans docker-compose.yml
                    sh "sed -i 's#nginx:latest#${dockerImage.imageName}#' /home/FRONTEND/docker-compose.yml"

                    // Lancer docker-compose
                    sh 'docker-compose -f /home/FRONTEND/docker-compose.yml up -d'
                }
            }
        }
    }
}
