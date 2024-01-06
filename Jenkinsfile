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
                    // Construire l'image Docker avec la version spécifiée
                    sh "docker build -t nginx:${dockerImageTag} --build-arg NGINX_VERSION=${dockerImageTag} ."
                }
            }
        }
        stage('Display Current Docker Compose Image') {
            steps {
                script {
                    // Lire le fichier docker-compose.yml en tant que structure de données YAML
                    def dockerComposeYaml = readYaml file: "${dockerComposeFile}"

                    // Afficher la valeur actuelle du champ 'image'
                    echo "Current Docker Compose Image: ${dockerComposeYaml.services.nginx.image}"
                }
            }
        }
        stage('Update Docker Compose') {
            steps {
                script {
                    // Lire à nouveau le fichier docker-compose.yml en tant que structure de données YAML
                    def dockerComposeYaml = readYaml file: "${dockerComposeFile}"

                    // Mettre à jour le champ 'image' avec le nouveau tag
                    dockerComposeYaml.services.nginx.image = "nginx:${dockerImageTag}"

                    // Écrire la structure de données YAML mise à jour dans le fichier
                    writeYaml file: "${dockerComposeFile}", data: dockerComposeYaml
                }
            }
        }
    }
}
