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
        sh 'npm install -g @angular/cli'
      }
    }

    stage('build') {
      steps {
        sh "docker build -t - pokeapp --file dockerfile ."
      }
    }

    stage('deploy') {
      steps {
        sh "/usr/local/bin/docker run -d -p ${container_port}:80 --name ${container_name} ${image_name}:${tag_image}"
      }
    }
  }
} 
