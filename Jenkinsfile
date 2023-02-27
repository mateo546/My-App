pipeline {
  agent any
  
  tools {
    nodejs 'NodeJS'
    dockerTool 'Docker1'
  }
  
 parameters {
    string(name: 'container_name', defaultValue: 'pagina_web', description: 'Nombre del contenedor de docker.')
    string(name: 'image_name', defaultValue: 'pagina_img', description: 'Nombre de la imagene docker.')
    string(name: 'tag_image', defaultValue: 'lts', description: 'Tag de la imagen de la página.')
    //string(name: 'container_port', defaultValue: '80', description: 'Puerto que usa el contenedor')
  }
  
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
}
