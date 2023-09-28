pipeline {
    agent any

    environment {
        // Define variables here, such as the Docker registry, image name, and tag
        DOCKER_REGISTRY = 'dineshcode97' // Replace with your Docker registry URL
        DOCKER_IMAGE_NAME = 'my-app' // Replace with your desired image name
        DOCKER_IMAGE_TAG = 'latest' // Replace with your desired image tag
    }

    stages {
        stage('Checkout') {
            steps {
                // Check out your GitHub repository
                git branch: 'main', url: 'https://github.com/dineshcode97/buildkitelearning.git'
            }
        }

        stage('Build Docker Image') {
            steps {
                    sh 'ls -la'
                sh 'pwd'
                    sh 'sudo docker build -t ${DOCKER_REGISTRY}/${DOCKER_IMAGE_NAME}:${DOCKER_IMAGE_TAG} .'
            }
        }

        stage('Push Docker Image') {
            steps {
                withCredentials([usernamePassword(credentialsId: 'dhubpass', passwordVariable: 'DHPASS', usernameVariable: 'DHUSER')]) {
                 sh 'sudp docker login -u $DHUSER -p $DHPASS'
                 sh 'sudo docker push ${DOCKER_REGISTRY}/${DOCKER_IMAGE_NAME}:${DOCKER_IMAGE_TAG}'
                }
                }
            }
    }
       
    post {
        success {
            // Notify or perform additional actions on successful build and push
            echo 'Docker image build and push successful!'
        }
        failure {
            // Handle failure, e.g., send notifications or clean up resources
            echo 'Docker image build and push failed.'
        }
    }
}
