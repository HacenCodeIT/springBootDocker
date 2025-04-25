pipeline {
    agent any
    docker {
          image 'maven:3.9.6-eclipse-temurin-21' // Maven + JDK 21
          args '-v /root/.m2:/root/.m2' // optional for caching dependencies
        }

   tools {
              jdk 'JDK 21'  // Make sure this name matches what you configured in Jenkins
          }
   environment {
           // Set JAVA_HOME globally for all stages in the pipeline
           JAVA_HOME = '/usr/lib/jvm/java-11-openjdk-amd64'  // Adjust the path based on your system
       }

    stages {
        stage('Clone Repository') {
            steps {
                git branch: 'dev', url: 'https://github.com/HacenCodeIT/springBootDocker.git'
            }
        }

        stage('Build') {
            steps {
                echo '🔨 Building the application...'
                sh 'mvn clean package'
            }
        }

        stage('Test') {
            steps {
                echo '🧪 Running tests...'
                sh 'mvn test'
            }
        }

        stage('Deploy') {
            steps {
                echo '🚀 Deploying the application...'
                // You can customize this step to deploy to a server, Docker, or cloud
                // Example: sh 'scp target/*.jar user@your-server:/opt/apps/'
            }
        }
    }

    post {
        success {
            echo '✅ Build and deploy successful!'
        }
        failure {
            echo '❌ Build failed!'
        }
    }
}
