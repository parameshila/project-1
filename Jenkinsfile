pipeline {
    agent any

    stages {
        stage('Checkout') {
            steps {
              checkout([$class: 'GitSCM', branches: [[name: '*/s1']], extensions: [], userRemoteConfigs: [[url: 'https://github.com/parameshila/project-1.git']]])
            }
        }
        stage('Build image') {
            steps {
                sh 'docker.withRegistry('https://registry.hub.docker.com','docker_credentials')'
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
