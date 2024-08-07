pipeline {
    agent any

    stages {
        stage('Build Docker Image') {
            steps {
                sh 'echo "Executando Docker Build"'
            }
        }

        stage('Push Docker Image') {
            steps {
                sh 'echo "Executando Docker push"'
            }
        }

        stage('Deploy Kubernetes') {
            steps {
                sh 'echo "Executando kubectl apply"'
            }
        }
    }
}
