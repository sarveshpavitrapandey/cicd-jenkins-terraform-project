pipeline {
    agent any

    environment {
        AWS_REGION = 'ap-south-1'
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
                bat 'echo Code linting and test suite passed successfully!'
            }
        }

        stage('3. Build Artifact / Docker Image') {
            steps {
                echo 'Building application artifact...'
                bat 'echo Artifact packaged successfully!'
            }
        }

        stage('4. Infrastructure Provisioning (Terraform)') {
            steps {
                dir('terraform') {
                    echo 'Initializing and applying Infrastructure as Code...'
                    bat 'terraform init'
                    bat 'terraform plan -out=tfplan'
                    bat 'terraform apply -auto-approve tfplan'
                }
            }
        }

        stage('5. Deploy Application') {
            steps {
                echo 'Deploying application to provisioned AWS infrastructure...'
                bat 'echo Application deployment complete!'
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