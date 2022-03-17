pipeline {
    agent any

    stages {
        stage('Checkout') {
            steps {
              git credentialsId: "${github_creds}", url: "${github_repo}"
            }
        }
        stage('Build image') {
            steps {
                sh 'docker.withRegistry('https://registry.hub.docker.com',docker_credentials')'
                sh 'def customimage=docker.build("parameshila/project-1:latest")'
                sh 'customimage.push'
       }

           }
        stage('Deploy'){
            steps {
               sh 'docker run -d parameshila/project-1:latest'
            }
       }
     
       stage('Validate') {
            steps {
                sh 'mvn validate'
            }
        }
        stage('Build') {
            steps {
                sh 'mvn package'
            }
        }
        stage('Test') {
            steps {
                sh 'mvn test'
            }
        }
        stage('Deploy') {
            steps {
                echo 'Deploying....'
            }
        }

  }

}
