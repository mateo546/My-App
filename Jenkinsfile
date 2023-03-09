pipeline {
  agent any
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
        withCredentials(bindings: [azureServicePrincipal('Azure-Service-Principal-Prod')]) {
          sh 'az login --service-principal -u ${AZURE_CLIENT_ID} -p ${AZURE_CLIENT_SECRET} --tenant ${AZURE_TENANT_ID}'
          sh "az webapp create -g SOCIUSRGLAB-RG-MODELODEVOPS-PROD -p Plan-SociusRGLABRGModeloDevOpsDockerProd  -n sociuswebapptest005p -i mateocolombo/pokeapp:${params.tag_image}"
        }

      }
    }

    stage('Manual Intervention') {
      steps {
        input(message: 'Confirm Pokeapp deploy to production?', ok: 'Yes. do it')
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
    string(name: 'container_name', defaultValue: 'pokeapp_web', description: 'Nombre del contenedor de docker.')
    string(name: 'image_name', defaultValue: 'pokeapp', description: 'Nombre de la imagene docker.')
    string(name: 'tag_image', defaultValue: 'lts', description: 'Tag de la imagen de la página.')
    string(name: 'container_port', defaultValue: '80', description: 'Puerto que usa el contenedor.')
  }
}
