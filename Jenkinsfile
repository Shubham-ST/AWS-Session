pipeline {
    agent { label "dev-agent" }
    stages{
        stage("Code") {
            steps {
                echo "code cloning"
                git url: "https://github.com/Shubham-ST/AWS-Session.git" , branch: "main"
            }
        }
        stage("build and Test") {
            steps {
                echo "Building and testing"
                sh "docker build . -t nodejs-app"
            }
        }
        stage("Login to Dockerhub and Push image") {
            steps {
                withCredentials([usernamePassword(credentialsId:"dockerhub",passwordVariable:"dockerHubPass",usernameVariable:"dockerHubUser")]) {
                    sh "docker login -u ${env.dockerHubUser} -p ${env.dockerHubPass}"
                    sh "docker tag nodejs-app ${env.dockerHubUser}/nodejs-app:latest"
                    sh "docker push ${env.dockerHubUser}/nodejs-app:latest"
                }
            }
        }
        stage("Deploy") {
            steps {
                echo "Deploying"
                sh "docker-compose down && docker-compose up -d"
            }
        }
    }
}
