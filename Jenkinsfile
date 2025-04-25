pipeline {
    agent any
    tools{
           jdk 'JDK 21'         // Name must match what you added in Global Tool Config
           maven 'maven-3.9.9'
    }
    stages{
        stage('Build Maven'){
            steps{
                checkout([$class: 'GitSCM', branches: [[name: '*/dev']], extensions: [], userRemoteConfigs: [[url: 'https://github.com/HacenCodeIT/springBootDocker.git']]])
                sh 'mvn clean install'
            }
        }
                stage('Check Docker') {
                    steps {
                        sh 'docker --version'
                    }
                }

                stage('Build Docker Image') {
                    steps {
                        sh 'docker build -t HacenCodeIT/springBootDocker .'
                    }
                }
            }
}