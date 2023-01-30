pipeline{
    agent any
    tools{
        maven 'maven'
    }
    stages{
        stage('Build Maven'){
            steps{
                checkout scmGit(branches: [[name: '*/main']], extensions: [], userRemoteConfigs: [[url: 'https://github.com/SachPrecious/maven-demo.git']])
                sh 'mvn clean install'

            }
        }
        stage('Test'){
                    steps{
                        sh 'mvn test'
                    }
                }
        stage('Build Docker Image'){
            steps{
                sh 'docker build -t sachithram/devops-integration .'
            }
        }

        stage('Push Image to Docker Hub'){
            steps{
               withCredentials([string(credentialsId: 'dockerhub-pwd', variable: 'dockerhubpwd')]) {
                    sh 'docker login -u sachithram -p ${dockerhubpwd}'
                }
                sh 'docker push sachithram/devops-integration'
            }
        }
        
        stage('Push Image to Nexus Repo'){
            steps{
                                  
                sh 'docker login http://10.101.16.48:8083/repository/my-app-repo/'           
                sh 'docker push 10.101.16.48:8083/repository/my-app-repo/'
            }
        }


        




    }

}
