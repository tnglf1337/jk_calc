pipeline {
    agent any

    environment {
            PATH = "/usr/local/bin/docker"
        }

    tools {
        // Install the Maven version configured as "M3" and add it to the path.
        maven "M3"
    }

    stages {
        stage('Build and Analyse') {
            steps {
                // Führt einen anderen Job aus (z. B. einen Freestyle-Job)
                build job: 'calc-freestyle'
            }
        }

        stage('Build jar') {
            steps {
                sh 'mvn clean package spring-boot:repackage'
            }
        }

        stage('Create Docker Image') {
            steps {
                sh 'docker build -t tneskedev/calc:latest'
            }
        }

        stage('Push Image to Dockerhub') {
            steps {
                withCredentials([usernamePassword(credentialsId: 'dockerhub-credentials',
                usernameVariable: 'USERNAME', passwordVariable: 'PASSWORD')]) {
                    sh "docker login --username $USERNAME --password $PASSWORD"
                    sh "docker push tneskedev/calc:latest"
                }
            }
        }
    }
}
