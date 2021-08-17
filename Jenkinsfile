node(){
  try{
    def buildNum = env.BUILD_NUMBER 
    def branchName= env.BRANCH_NAME
    
    print buildNum
    print branchName

    
    stage('Env - run docker'){
      sh "docker run Dockerfile"
      sh "docker ps -a"
      
    }
  }
