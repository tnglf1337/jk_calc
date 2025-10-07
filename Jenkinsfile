pipeline {
    agent any

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
    }
}
