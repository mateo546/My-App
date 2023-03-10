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
    string(name: 'image_name', defaultValue: 'pokeapp', description: 'Nombre de la imagene docker.')
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
        sh "docker pull  mateocolombo/pokeapp:${params.tag_image}"
      }
    }
    
    stage('Azure App Service deploy') {
      steps {
         withCredentials(bindings: [azureServicePrincipal('Azure-Service-Principal')]) {
           sh 'az login --service-principal -u ${AZURE_CLIENT_ID} -p ${AZURE_CLIENT_SECRET} --tenant ${AZURE_TENANT_ID}'
           script {
             def appSettingsJson = readFile 'appsettings.json'
             sh "az webapp create -g SOCIUSRGLAB-RG-MODELODEVOPS-DEV -p Plan-SociusRGLABRGModeloDevOpsDockerDev  -n sociuswebapptest011 -i mateocolombo/pokeapp:${params.tag_image} --settings '${appSettingsJson}'"
           }
         }
      }
    }
  }
   post {
        success {
            build job: 'testing', parameters: [string(name: 'tag_image', value:"${params.tag_image}")]
