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
        sh "docker build -t ${image_name}:${tag_image} --file dockerfile ."
      }
    }

    stage('deploy') {
      steps {
        sh "docker rm -f 144f8e4c0dbc285b59c575b3bff84725708509744a8dcfc33b29d9ede86fb374" // Elimina el contenedor si existe
        sh "docker run -d -p ${container_port}:80 --name ${container_name} ${image_name}:${tag_image}"
      }
    }

  }
  tools {
    nodejs 'NodeJS'
    dockerTool 'Docker1'
  }
  parameters {
    string(name: 'container_name', defaultValue: 'pokeapp_web', description: 'Nombre del contenedor de docker.')
    string(name: 'image_name', defaultValue: 'pokeapp', description: 'Nombre de la imagene docker.')
    string(name: 'tag_image', defaultValue: '1.17.1-alpine', description: 'Tag de la imagen de la página.')
    string(name: 'container_port', defaultValue: '80', description: 'Puerto que usa el contenedor.')
  }
}
