pipeline {
    agent any

    tools {
        maven '3.8.4'
    }

    stages {
        stage('Build') {
            steps {
                sh "mvn clean package"
                sh "printenv"
            }
        }
    }
}
