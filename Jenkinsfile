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
        stage('terraform init') {
            steps {
                sh 'cd /home/ec2-user && terraform init'
            }
        }
        stage('terraform apply') {
            steps {
                sh 'terraform plan'
            }
        }
    }
}
