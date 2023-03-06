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

    stage('Login') {
      steps {
        sh 'echo $DOCKERHUB_CREDENTIALS_PSW | docker login -u $DOCKERHUB_CREDENTIALS_USR --password dckr_pat_MxjKQobzyCYEwyBEeeONWao_psU'
      }
    }

    stage('Push') {
      steps {
         sh "docker tag ${image_name}:${tag_image} mateocolombo/pokeapp:${tag_image}"
        sh "docker push mateocolombo/pokeapp:${tag_image}"
      }
    }

  }
  tools {
    nodejs 'NodeJS'
    dockerTool 'Docker1'
  }
  environment {
    DOCKERHUB_CREDENTIALS = credentials('mateocolombo-dockerhub')
  }
  
  parameters {
    string(name: 'container_name', defaultValue: 'pagina_web', description: 'Nombre del contenedor de docker.')
    string(name: 'image_name', defaultValue: 'pokeapp', description: 'Nombre de la imagen de docker.')
    string(name: 'tag_image', defaultValue: 'lts', description: 'Tag de la imagen de la página.')
    string(name: 'container_port', defaultValue: '80', description: 'Puerto que usa el contenedor')
  }
}
  
