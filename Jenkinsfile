pipeline {
    agent any
    withCredentials([usernamePassword(credentialsId: 'aws-key', usernameVariable: 'AWS_ACCESS_KEY_ID', passwordVariable: 'AWS_SECRET_ACCESS_KEY')]) { 
    
    stages {
        stage('Checkout Terraform Project') {
            steps {
                git branch: 'main', url: 'https://github.com/NeeharikaRN/Terraform_Jenkins_CICD.git'
            }
        }
        stage('INIT') {
            steps {
                bat 'terraform init'
            }
        }
        stage('SANITY CHECK') {
            steps {
                bat 'terraform validate'
            }
        }
        stage('PLAN') {
            steps {
                bat 'terraform plan -out "s3.tfplan"'
            }
        }
        stage('FORMAT') {
            steps {
                bat 'terraform fmt'
            }
        }
        stage('Approval') {
            steps {
                input 'Proceed to apply Terraform changes?'
            }
        }
        stage('APPLY') {
            steps {
                bat 'terraform apply "s3.tfplan"'
            }
        }
        stage('RESOURCES LIST') {
            steps {
                bat 'terraform state list'
            }
        }
    }
    }
}
