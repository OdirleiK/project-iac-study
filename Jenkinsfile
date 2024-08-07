pipeline {
    agent any

    tools {
        maven 'Maven 3.8.5' 
    }

    stages {
        stage('Build Project') {
            steps {
                script {
                    sh 'mvn clean package -DskipTests'
                }
            }
        }
        
        stage('Build Docker Image') {
            steps {
                script {
                    dockerapp = docker.build("kmpx/java-with-iac:${env.BUILD_ID}", '-f ./project-iac-study/Dockerfile ./project-iac-study')
                }
            }
        }

        stage('Push Docker Image') {
            steps {
                script {
                    docker.withRegistry('https://registry.hub.docker.com', 'dockerhub') {
                        dockerapp.push('latest')
                        dockerapp.push("${env.BUILD_ID}")
                    }
                }
            }
        }

        stage('Deploy Kubernetes') {
            steps {
                sh 'echo "Executando kubectl apply"'
            }
        }
    }
}
