pipeline {
    agent any

    stages {
        stage('Checkout') {
            steps {
                git branch: 'main', url: 'https://github.com/coderritesh/cicd-static-site'
            }
        }

        stage('Build Docker Image') {
            steps {
                script {
                    docker.build("static-website:latest")
                }
            }
        }

        stage('Deploy Container') {
            steps {
                script {
                    sh '''
                    docker stop static-website-container || true
                    docker rm static-website-container || true
                    docker run -d --name static-website-container -p 8081:80 static-website:latest
                    '''
                }
            }
        }
    }
}

