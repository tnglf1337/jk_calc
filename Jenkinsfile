pipeline {
    agent any

    environment {
        PATH = "/usr/local/bin:/usr/bin:/bin:$PATH"
    }

    tools {
        maven "M3"
    }

    stages {
        stage('Build and Analyse') {
            steps {
                build job: 'calc-freestyle'
            }
        }

        stage('Build jar') {
            steps {
                sh './mvnw clean package spring-boot:repackage'
            }
        }

        stage('Create Docker Image') {
            steps {
                sh 'docker build -t tneskedev/calc:latest .'
            }
        }

        stage('Push Image to Dockerhub') {
            steps {
                withCredentials([usernamePassword(credentialsId: 'dockerhub-credentials',
                                                 usernameVariable: 'USERNAME',
                                                 passwordVariable: 'PASSWORD')]) {
                    sh "docker login --username $USERNAME --password $PASSWORD"
                    sh "docker push tneskedev/calc:latest"
                }
            }
        }
    }
}
