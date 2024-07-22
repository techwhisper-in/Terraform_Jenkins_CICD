pipeline {
    agent any
    environment {
        AWS_ACCESS_KEY_ID = ""
        AWS_SECRET_ACCESS_KEY = ""
    }
    
    stages {
        stage('Checkout Terraform Project') {
            steps {
                git branch: 'main', url: 'https://github.com/NeeharikaRN/Terraform_Jenkins_CICD.git'
            }
        }
        stage('INIT') {
            steps {
                script {
                    withCredentials([usernamePassword(credentialsId: 'aws-key', usernameVariable: 'AWS_ACCESS_KEY_ID', passwordVariable: 'AWS_SECRET_ACCESS_KEY')]) {
                        // Inside this block, AWS_ACCESS_KEY_ID and AWS_SECRET_ACCESS_KEY are securely set
                        bat 'terraform init'
                    }
                }
            }
        }
        stage('SANITY CHECK') {
            steps {
                script {
                    withCredentials([usernamePassword(credentialsId: 'aws-key', usernameVariable: 'AWS_ACCESS_KEY_ID', passwordVariable: 'AWS_SECRET_ACCESS_KEY')]) {
                        bat 'terraform validate'
                    }
                }
            }
        }
        stage('PLAN') {
            steps {
                script {
                    withCredentials([usernamePassword(credentialsId: 'aws-key', usernameVariable: 'AWS_ACCESS_KEY_ID', passwordVariable: 'AWS_SECRET_ACCESS_KEY')]) {
                        bat 'terraform plan -out "s3.tfplan"'
                    }
                }
            }
        }
        stage('FORMAT') {
            steps {
                script {
                    bat 'terraform fmt'
                }
            }
        }
        stage('Approval') {
            steps {
                script {
                    input 'Proceed to apply Terraform changes?'
                }
            }
        }
        stage('APPLY') {
            steps {
                script {
                    withCredentials([usernamePassword(credentialsId: 'aws-key', usernameVariable: 'AWS_ACCESS_KEY_ID', passwordVariable: 'AWS_SECRET_ACCESS_KEY')]) {
                        bat 'terraform apply "s3.tfplan"'
                    }
                }
            }
        }
        stage('RESOURCES LIST') {
            steps {
                bat 'terraform state list'
            }
        }
    }
}
