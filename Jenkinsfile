pipeline {
    agent any

   tools {
              jdk 'JDK 21'  // Make sure this name matches what you configured in Jenkins
              maven 'Maven' // 👈 This must match the name you just added
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
