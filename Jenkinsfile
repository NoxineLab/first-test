pipeline {
    agent {
        docker {
            image 'node:14-alpine' 
            label 'docker-node'
        }
    stages {
        stage('Test') {
            steps {
                sh 'node --version'
            }
        }
    }
}
