pipeline {
    environment {
        imagename = "ragavan05/demo"
        registryCredential = 'ragavan05'
        dockerImage = ''
    }
    agent any
    stages {
        stage('Cloning Git') {
            steps {
                git(url: 'https://github.com/mveeraragahavan/aaraispvtltd.git', branch: 'main', credentialsId: 'ragavan05')
            }
        }
        stage('Building image') {
            steps {
                script {
                    dockerImage = docker.build(imagename)
                }
            }
        }
        stage('Deploy Image') {
            steps {
                script {
                    docker.withRegistry('', registryCredential) {
                        dockerImage.push("$BUILD_NUMBER")
                        dockerImage.push('latest')
                    }
                }
            }
        }
        stage('Remove Unused docker image') {
            steps {
                sh "docker rmi $imagename:$BUILD_NUMBER"
                sh "docker rmi $imagename:latest"
            }
        }
    }
}
