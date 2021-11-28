pipeline {
    agent {
        docker {
            image '192.168.199.17:5000/myjenkins-agent:latest'
        }
    }

    tools {
        dockerTool 'latest'
        maven '3.8.4'
        jdk 'jdk8'
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
                sh "docker build --build-arg JAR_FILE=target/demojar-0.0.1-SNAPSHOT.jar -t demojar:latest ."
            }
        }
    }
}
