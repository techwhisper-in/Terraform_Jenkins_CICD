@Library('github.com/releaseworks/jenkinslib') _
node{
    withCredentials([[$class: 'UsernamePasswordMultiBinding', credentialsId: 'aws-key', usernameVariable: 'AWS_ACCESS_KEY_ID', passwordVariable: 'AWS_SECRET_ACCESS_KEY']]) {
        stage 'Checkout Terraform Project'
            git branch: 'main', url: 'https://gitlab.com/n.neeharikareddy/terraformrepo.git'
        stage 'INIT'
            bat 'terraform init'
        stage 'SANITY CHECK'
            bat 'terraform validate'
        stage 'PLAN'
            bat 'terraform plan -out "s3.tfplan"'
        stage 'FORMAT'
            bat 'terraform fmt'
        stage 'APPLY'
            bat 'terraform apply "s3.tfplan"'
        stage("List S3 buckets") 
            bat 'terraform state list'
  }    
}
