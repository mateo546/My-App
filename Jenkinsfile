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
        sh 'docker build -t ${image_name} --file dockerfile .'
      }
    }

    stage('deploy') {
      steps {
        sh "docker rm –f de6c602d980326670f3b18af1601f1ac9c7d0aed076812a56e7ef49566c8b778 " // Elimina el contenedor si existe
        sh 'docker run -d -it -p 80:80 pokeapp .'
      }
    }

  }
  tools {
    nodejs 'NodeJS'
    dockerTool 'Docker1'
  }
  parameters {
    parameters {
    string(name: 'container_name', defaultValue: 'pagina_web', description: 'Nombre del contenedor de docker.')
    string(name: 'image_name', defaultValue: 'pokeapp', description: 'Nombre de la imagene docker.')
    string(name: 'tag_image', defaultValue: 'lts', description: 'Tag de la imagen de la página.')
    string(name: 'container_port', defaultValue: '80', description: 'Puerto que usa el contenedor')
  }
  }
}
