pipeline {
  agent any
  
  enviroment {
    DOCKERHUB_CREDENTIALS = credentials('dockerhub')
  }
  
  stages {
    stage('Install') {
      steps {
        git(branch: 'master', url: 'https://github.com/mateo546/My-App.git')
        sh 'npm install'
      }
    }

    stage('build') {
      steps {
        sh 'docker build -t pokeapp --file dockerfile .'
      }
    }
    
    stage ('Login') {
      steps {
        sh 'echo $DOCKERHUB_CREDENTIALS_PSW | docker login -u $DOCKERHUB_CREDENTIALS_USR --password stdin' 
      }
    }
    
    stage ('Push') {
      steps {
        sh 'docker push pokeapp'
      }
    }

    stage('deploy') {
      steps {
        sh 'docker rm -f pokeapp'
        sh 'docker run -d -it -p 80:80 pokeapp'
      }
    }

  }
  tools {
    nodejs 'NodeJS'
    dockerTool 'Docker1'
  }
}
