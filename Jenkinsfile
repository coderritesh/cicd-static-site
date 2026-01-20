pipeline {
    agent any

    stages {

        stage('Checkout Code') {
            steps {
                git branch: 'main',
                    url: 'https://github.com/coderritesh/cicd-static-site.git'
            }
        }

        stage('Build Docker Image') {
            steps {
                sh '''
                docker build -t static-website:latest .
                '''
            }
        }

        stage('Security Scan (Trivy)') {
            steps {
                sh '''
                trivy image --exit-code 0 static-website:latest || true
                '''
            }
        }

        stage('Deploy Container') {
            steps {
                sh '''
                docker stop static-website-container || true
                docker rm static-website-container || true

                docker run -d \
                  --name static-website-container \
                  -p 8081:80 \
                  static-website:latest
                '''
            }
        }
    }

    post {
        success {
            echo "✅ DevSecOps Pipeline Completed Successfully"
        }
        failure {
            echo "❌ Pipeline Failed"
        }
    }
}


