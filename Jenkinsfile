pipeline {
    agent any

    tools {
        maven '3.8.4'
        docker 'latest'
    }

    stages {
        stage('Compile') {
            steps {
                configFileProvider([configFile(fileId: '3ceeb386-c3b5-4676-ab96-34949ac93114', variable: 'MAVEN_SETTINGS')]) {
                    sh "mvn -s $MAVEN_SETTINGS clean compile"
                }
            }
        }
        stage('Test') {
            steps {
                configFileProvider([configFile(fileId: '3ceeb386-c3b5-4676-ab96-34949ac93114', variable: 'MAVEN_SETTINGS')]) {
                    sh "mvn -s $MAVEN_SETTINGS verify"
                }
            }
        }
        stage('Package') {
            steps {
                configFileProvider([configFile(fileId: '3ceeb386-c3b5-4676-ab96-34949ac93114', variable: 'MAVEN_SETTINGS')]) {
                    sh "mvn -s $MAVEN_SETTINGS package"
                }
            }
        }
        stage('BuildImage') {
            steps {
                sh "docker build --build-arg JAR_FILE=build/*.jar -t demojar:latest ."
            }
        }
    }
}
