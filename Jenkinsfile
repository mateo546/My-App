pipeline {
  agent any
  
  tools {
    nodejs "NodeJS"
  }
  
  parameters {
    string(name: 'container_name', defaultValue: 'Poke-App', description: 'nombre del contenedor.')
    string(name: 'image_name', defaultValue: 'pagina_img', description: 'nombre de la imagen de docker.')
    string(name: 'tag_image', defaultValue: 'lts', description: 'tag de la imagen de la pagina.')
  }

  stages {
    stage('Install') {
      steps {
        git branch: 'master', url: 'https://github.com/mateo546/My-App.git'
        
        sh 'npm install'
      }
    }
    
    stage('build') {
      steps {
        sh 'npm run build'
        sh 'docker build -t ${image-name}:${tag_image} .'
      }
    }
    stage('deploy') {
      steps {
        sh docker run -d -p 80:80 --name ${container_name} ${image_name}:${tag_image}"
        
      }
    } 
  } 
}
