pipeline {
    agent {
        node {
            label 'master'
        }
    }
    stages {
        stage('terraform start') {
            steps {
                sh 'echo "started...." '
            }
        }
        stage('git clone') {
            steps {
                sh 'rm -rf terraform-jenkins && git clone https://github.com/yashas123456/terraform-jenkins'
            }
        }
        stage('copy files') {
            steps {
                sh 'cd terraform-jenkins/ && terraform init'
            }
        }
        stage('terraform init') {
            steps {
                sh 'terraform plan'
            }
        }
        stage('terraform apply') {
            steps {
                sh 'terraform plan'
            }
        }
    }
}
