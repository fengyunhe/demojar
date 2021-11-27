pipeline {
    agent any

    tools {
        maven '3.8.4'
    }

    stages {
        stage('Build') {
            steps {
                configFileProvider([configFile(fileId: '3ceeb386-c3b5-4676-ab96-34949ac93114', variable: 'MAVEN_SETTINGS')]) {
                   sh "mvn -s $MAVEN_SETTINGS clean package"
                   sh "printenv"
                }
            }
        }
    }
}
