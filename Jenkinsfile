pipeline {
  agent any
  stages {
    stage('install') {
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
        sh "docker rm -f 751f5e6ea0bd5983bcef7320200ab1aa8b25f738dc9d65d1bcf6d66d59802627" // Elimina el contenedor si existe
        sh "docker run -d -it -p 80:80 pokeapp ."
      }
    }

  }
  tools {
    nodejs 'NodeJS'
    dockerTool 'Docker1'
  }
  parameters {
    string(name: 'container_name', defaultValue: 'pokeapp_web', description: 'Nombre del contenedor de docker.')
  }
}
