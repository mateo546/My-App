pipeline {
  agent any
  
  tools {
    nodejs 'NodeJS'
    dockerTool 'Docker1'
  }
  
  parameters {
    string(name: 'container_name', defaultValue: 'pagina_web', description: 'Nombre del contenedor de docker.')
  }
  
  stages {
    stage('install') {
      steps {
        git branch: 'main', url: 'https://github.com/mateo546/My-App.git'
        sh 'npm install'
      }
    }


    stage('build') {
      steps {
        sh "docker build -t pokeapp --file dockerfile ."
      }
    }
    
    stage('deploy') {
      steps {
         sh "docker rm –f de6c602d980326670f3b18af1601f1ac9c7d0aed076812a56e7ef49566c8b778 " // Elimina el contenedor si existe
        sh "docker run -d -it -p 80:80 --name ${container_name}  
      }
    }
  }
}
