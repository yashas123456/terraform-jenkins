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
                sh 'sudo git clone https://github.com/yashas123456/terraform-jenkins'
            }
        }
        stage('copy files') {
            steps {
                sh 'sudo cp /home/ubuntu/jenkins-terraform/* ./jenkins'
            }
        }
        stage('terraform init') {
            steps {
                sh 'terraform init'
            }
        }
        stage('terraform apply') {
            steps {
                sh 'terraform apply'
            }
        }
    }
}
