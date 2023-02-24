pipeline {
  agent any
  
   tools {
    nodejs 'NodeJS'
  }
  parameters {
    string(name: 'container_name', defaultValue: 'pagina_web', description: 'nombre del contenedor.')
    string(name: 'image_name', defaultValue: 'pagina_img', description: 'nombre de la imagen de docker.')
    string(name: 'tag_image', defaultValue: 'lts', description: 'tag de la imagen de la pagina.')
    string(name: 'container_port', defaultValue: '80', description: 'Puerto que usa el contenedor')
  }
  
  stages {
    stage('Install') {
      steps {
        git(branch: 'master', url: 'https://github.com/mateo546/My-App.git')
        sh 'npm install'
        sh 'npm install -g @angular/cli'
        sh 'npm run build'
      }
    }

    stage('build') {
      steps {
        sh 'ng build'
        sh "docker build -t ${image-name}:${tag_image} --file dockerfile ."
      }
    }

    stage('deploy') {
      steps {
        sh "/usr/local/bin/docker run -d -p ${container_port}:80 --name ${container_name} ${image_name}:${tag_image}"
      }
    }
  }
} 
