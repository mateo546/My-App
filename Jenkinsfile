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
    string(name: 'image_name', defaultValue: 'pokeapp', description: 'Nombre de la imagene docker.')
    string(name: 'tag_image', defaultValue: '1.17.1-alpine', description: 'Tag de la imagen de la página.')
    string(name: 'container_port', defaultValue: '80', description: 'Puerto que usa el contenedor.')
  }
  
  stages {
    stage('install') {
      steps {
        git(branch: 'master', url: 'https://github.com/mateo546/My-App.git')
        sh 'npm install'
      }
    }
    
    stage('Login') {
      steps {
        sh 'echo $DOCKERHUB_CREDENTIALS_PSW | docker login -u $DOCKERHUB_CREDENTIALS_USR --password dckr_pat_MxjKQobzyCYEwyBEeeONWao_psU'
      }
    }
    
    stage('Image Pull') {
      steps {
        sh 'docker pull  mateocolombo/pokeapp:lts'
      }
    }
    
    stage('Azure App Service deploy') {
      steps {
         withCredentials(bindings: [azureServicePrincipal('Azure-Service-Principal')]) {
           sh 'curl -sL https://aka.ms/InstallAzureCLIDeb | bash'
           sh 'az login --service-principal -u ${AZURE_CLIENT_ID} -p ${AZURE_CLIENT_SECRET} --tenant ${AZURE_TENANT_ID}'        
           sh 'az webapp create -g SOCIUSRGLAB-RG-MODELODEVOPS-DEV -p Plan-SociusRGLABRGModeloDevOpsDockerDev  -n sociuswebapptest011 -i mateocolombo/pokeapp:1.17.1-alpine'
         }
      }
    }
  }
}

