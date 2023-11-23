pipeline {
    agent {
        label 'agent_hieuvn3'
    }

    stages {
        stage('Hello') {
            steps {
                cleanWs()
                echo 'It Working!'
                checkout scmGit(branches: [[name: '*/master']], extensions: [], userRemoteConfigs: [[url: 'https://github.com/HieuDepZaii/ecommerce-application.git']])
                sh 'ls'
            }
        }
        
         stage('Build and Push Docker Image') {
            steps {
                script {
                    sh 'ls'
                    // Define Docker-related commands to build and push your Docker image
                    def dockerImage = 'hieuchunhat/ecommerce-application:latest'
                    sh "docker build -t ${dockerImage} ."
                    sh "docker push ${dockerImage}"
                }
            }
        }
        
        stage('Pull Docker Image') {
            steps {
                script {
                    def dockerImage = 'hieuchunhat/ecommerce-application:latest'
                    sh "docker image pull ${dockerImage}"
                    sh 'docker stop ecommerce-application && docker rm ecommerce-application'
                    sh "docker run -d -p 5000:8080 --name ecommerce-application ${dockerImage}"
                }
            }
        }
    }
}
