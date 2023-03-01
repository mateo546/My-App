pipeline {
  agent any
  
  tools {
    nodejs 'NodeJS'
    dockerTool 'Docker1'
  }
  
  stages {
    stage('Install') {
      steps {
        git(branch: 'master', url: 'https://github.com/mateo546/My-App.git')
        sh 'npm install'
      }
    }
    
    stage ('Push') {
      steps {
        sh 'docker push pokeapp'
      }
    }

    stage('deploy') {
      steps {
        sh 'docker rm -f 54fa6e88cb7afac7501283e308f85957e62dd3aa1f867c988e3c11688fb75139'
        sh 'docker run -d -it -p 80:80 pokeapp'
      }
    }
  }
}
