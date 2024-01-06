// pipeline {
//     agent any
//     environment {
//         NGINX_VERSION = ""  // Déclarer la variable ici
//         dockerImageTag = "v${env.BUILD_NUMBER}"
//         dockerComposeFile = "/home/FRONTEND/docker-compose.yml"
//     }
//     stages {
//         stage('Build') {
//             steps {
//                 script {
//                     // Construire l'image Docker avec la version spécifiée
//                     sh "NGINX_VERSION=${dockerImageTag} docker build -t nginx:${dockerImageTag} ."
//                 }
//             }
//         }
//         stage('Update Docker Compose') {
//             steps {
//                 script {
//                     // Mise à jour de la variable NGINX_VERSION avec le tag de l'image
//                     NGINX_VERSION = dockerImageTag
                    
//                     // Remplacer le tag de l'image dans docker-compose.yml
//                     sh "sed -i 's#nginx:${NGINX_VERSION}#nginx:${dockerImageTag}#' ${dockerComposeFile}"
//                 }
//             }
//         }
//         stage('Deploy') {
//             steps {
//                 script {
//                     // Lancer docker-compose
//                     sh "docker-compose -f ${dockerComposeFile} up -d"
//                 }
//             }
//         }
//     }
// }


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
        stage('Update Docker Compose') {
            steps {
                script {
                    // Lire le fichier docker-compose.yml en tant que structure de données YAML
                    def dockerComposeYaml = readYaml file: "${dockerComposeFile}"

                    // Mettre à jour le champ 'image' avec le nouveau tag
                    dockerComposeYaml.services.nginx.image = "nginx:${dockerImageTag}"

                    // Écrire la structure de données YAML mise à jour dans le fichier
                    writeYaml file: "${dockerComposeFile}", data: dockerComposeYaml
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

