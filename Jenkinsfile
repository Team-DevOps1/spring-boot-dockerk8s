pipeline{
    agent any
    tools{
        maven 'my_maven'
    }
    stages{
        stage("Build Maven"){
            steps{
                checkout scmGit(branches: [[name: '*/main']], extensions: [], userRemoteConfigs: [[url: 'https://github.com/Team-DevOps1/spring-boot-dockerk8s.git']])
                sh 'mvn clean install'
            }
        } 
        stage("Build Docker Image"){
            steps{
                withCredentials([usernamePassword(credentialsId: 'docker', passwordVariable: 'pass', usernameVariable: 'user')]) {
    // some block
    sh """
    docker build -t sb346/mynimage .
    echo $pass | docker login -u $user --password-stdin
    docker push sb346/mynimage
    """
                  }
            }
        }
        stage("kubernets Delpoyment and Service"){
            steps{
                withCredentials([file(credentialsId: 'kubernetes', variable: 'kube')]) {
    // some block
    sh """
    export KUBECONFIG=$kube
    kubectl apply -f mydep.yaml
    kubectl apply -f mnsvc.yaml
    """
               }
            }
        }
    }
}
