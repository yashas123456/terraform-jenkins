pipeline {
    agent {
        node {
            label 'master'
        }
    }
    stages {
        stage('terraform start') {
            steps {
                sh 'echo "start"'
            }
        }
        stage('git clone') {
            steps {
                sh 'git clone https://github.com/yashas123456/terraform-jenkins'
            }
        } 
        stage('check files') {
            steps {
                sh 'cd terraform-jenkins'
            }
        }
        stage('permission') {
            steps {
                sh 'chmod -R 777 *'
            }
        }   
        stage('terraform init') {
            steps {
                sh 'terraform init'
            }
        }
        stage('terraform apply') {
            steps {
                sh 'terraform plan'
            }
        }
    }
}
