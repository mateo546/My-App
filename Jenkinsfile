pipeline {
  agent any
  
  tools {
    nodejs 'NodeJS'
    dockerTool 'Docker1'
  }
  environment {
    DOCKERHUB_CREDENTIALS = credentials('mateocolombo-dockerhub')
  }
  
  parameters {
    string(name: 'container_name', defaultValue: 'pokeapp_web', description: 'Nombre del contenedor de docker.')
    string(name: 'image_name', defaultValue: 'pokeapp', description: 'Nombre de la imagen de docker.')
    string(name: 'tag_image', defaultValue: '1.17.1-apine', description: 'Tag de la imagen de la página.')
    string(name: 'container_port', defaultValue: '80', description: 'Puerto que usa el contenedor')
  }
  
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
    
    stage('Azure App Service deploy') {
      steps {
        sh "az login --service-principal -u 1c6914e6-5a2b-4c76-b99a-68614314529f -p zd.8Q~Q_OV6KR-BOcHF~SGTlmmpFW58fvcyKXa2Y --tenant 9297550c-fa07-4acd-ade0-49b8c437c2df"
        sh 'az webapp create -g SOCIUSRGLAB-RG-MODELODEVOPS-PROD -p Plan-SociusRGLABRGModeloDevOpsDockerProd  -n Pokeapp-web -i mateocolombo/pokeapp:1.17.1-alpine'
        }
      }
    }
  }
