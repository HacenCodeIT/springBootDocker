pipeline {
    agent any
    docker {
           image 'docker:24.0.7' // Docker CLI in container
           args '-v /var/run/docker.sock:/var/run/docker.sock' // allow access to host Docker
            }
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
        stage('Build docker image'){
            steps{
                script{
                    sh 'docker --version' // verify
                    sh 'docker build -t HacenCodeIT/springbootDocker .'
                }
            }
        }
    }
}