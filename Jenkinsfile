pipeline {
    agent any

    stages {
        stage('Clone Repo') {
            steps {
                git branch: 'main', url: 'https://github.com/coderritesh/cicd-static-site.git'
            }
        }

        stage('Build Docker Image') {
            steps {
                sh 'docker build -t cicd-static-site .'
            }
        }

        stage('Run Docker Container') {
            steps {
                sh '''
                docker stop cicd-container || true
                docker rm cicd-container || true
                docker run -d -p 8082:80 --name cicd-container cicd-static-site
                '''
            }
        }
    }
}
