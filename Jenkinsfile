node {  
    stage('Build') { 
        sh 'echo ($git rev-parse head)' 
    }
    stage('Test') { 
        sh 'echo "ok2"'
    }
    stage('Deploy') { 
        sh 'echo "ok3"'
    }
}
