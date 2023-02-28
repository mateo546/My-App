pipeline {
  agent any
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

    stage('deploy') {
      steps {
        sh 'docker rm -f pokeapp '
        sh 'docker run -d -it -p 80:80 pokeapp'
      }
    }

  }
  tools {
    nodejs 'NodeJS'
    dockerTool 'Docker1'
  }
}