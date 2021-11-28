pipeline {
    agent any

    tools {
        dockerTool 'CI_TOOLS_DOCKER'
        maven 'CI_TOOLS_MAVEN_3'
        jdk 'CI_TOOLS_JDK8'
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
                sh "docker -H tcp://192.168.199.17:2375 build --build-arg JAR_FILE=target/demojar-0.0.1-SNAPSHOT.jar -t demojar:latest ."
                sh "docker -H tcp://192.168.199.17:2375 tag demojar:latest 192.168.199.17:5000/demojar:latest"
                sh "docker -H tcp://192.168.199.17:2375 push 192.168.199.17:5000/demojar:latest"
            }
        }
    }

    post {
        always {
            junit testResults: "**/target/surefire-reports/*.xml"
        }
    }
}
