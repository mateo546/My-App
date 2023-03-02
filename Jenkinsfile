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
    
    stage('Azure App service deploysteps') {
      steps {
        // Authenticate with Azure using service principal credentials
        withCredentials([azureServicePrincipal('azureServicePrincipal')]) {
          // Install the Azure CLI
          sh 'curl -sL https://aka.ms/InstallAzureCLIDeb | sudo bash'
          // Login to Azure using service principal credentials
          sh 'az login --service-principal -u ${AZURE_CLIENT_ID} -p ${AZURE_CLIENT_SECRET} --tenant ${AZURE_TENANT_ID}'
          // Pull the Docker image from DockerHUB and tag it
          // Push the Docker image to the Azure App Service
          sh 'az webapp create -g MyResourceGroup -p MyPlan -n Pokeapp-web -i mateocolombo/pokeapp:1.17.1-alpine'
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
