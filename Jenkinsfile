pipeline {
    agent any

    stages {

        stage('Checkout Code') {
            steps {
                git branch: 'main',
                    url: 'https://github.com/coderritesh/cicd-static-site'
            }
        }

        stage('Build Docker Image') {
            steps {
                sh '''
                docker build -t static-website:latest .
                '''
            }
        }

        stage('Trivy Security Scan') {
            steps {
                sh '''
                trivy image --exit-code 0 --severity LOW,MEDIUM static-website:latest
                trivy image --exit-code 1 --severity HIGH,CRITICAL static-website:latest || true
                '''
            }
        }

        stage('Deploy Container') {
            steps {
                sh '''
                docker stop static-website-container || true
                docker rm static-website-container || true
                docker run -d -p 8081:80 --name static-website-container static-website:latest
                '''
            }
        }
    }
}

