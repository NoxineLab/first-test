pipeline {
    agent any
    stages {
        stage('Build') {
            agent {
                docker {
                    image 'nginx'
                    // Exécutez le conteneur sur le nœud spécifié au niveau supérieur du Pipeline, dans le même espace de travail, plutôt que sur un nouveau nœud entièrement :
                    reuseNode true
                }
            }
            steps {
                sh 'ngins --version'
            }
        }
    }
}
