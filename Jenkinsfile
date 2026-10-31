pipeline {
    agent any

    environment {
        AWS_REGION     = 'ap-south-1'
        DOCKER_IMAGE   = 'dbadshah07/cicd-demo-app'
        IMAGE_TAG      = "${BUILD_NUMBER}"
    }

    stages {
        stage('1. Checkout Code') {
            steps {
                echo 'Checking out source code from GitHub...'
                git branch: 'main', url: 'https://github.com/sarveshpavitrapandey/cicd-jenkins-terraform-project.git'
            }
        }

        stage('2. Lint & Unit Test') {
            steps {
                echo 'Executing code analysis and unit testing...'
                bat 'npm install'
                bat 'npm test --if-present'
            }
        }

        stage('3. Build Artifact / Docker Image') {
            steps {
                echo 'Building Docker container image...'
                bat "docker build -t %DOCKER_IMAGE%:%IMAGE_TAG% ."
                bat "docker tag %DOCKER_IMAGE%:%IMAGE_TAG% %DOCKER_IMAGE%:latest"
            }
        }

        stage('4. Infrastructure Provisioning (Terraform)') {
            steps {
                dir('terraform') {
                    echo 'Initializing and applying Infrastructure as Code...'
                    bat 'terraform init'
                    bat 'terraform plan -out=tfplan'
                    bat 'terraform apply tfplan'
                }
            }
        }

        stage('5. Deploy Application') {
            steps {
                echo 'Deploying application artifact/container...'
                bat "echo Deploying image %DOCKER_IMAGE%:%IMAGE_TAG% successfully!"
            }
        }
    }

    post {
        always {
            echo 'Pipeline execution complete.'
            cleanWs()
        }
        success {
            echo 'CI/CD Pipeline succeeded!'
        }
        failure {
            echo 'CI/CD Pipeline failed. Please check build logs.'
        }
    }
}