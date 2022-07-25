pipeline {

    //agent none
    //agent {label 'node1'}
    agent any
    
    environment {
        PASS = credentials('docker-registry-pass') 
    }

    stages {

        stage('Test') {
            //agent {label 'node2'}
            steps {
                sh 'sh jenkins/test/mvn.sh mvn test'
            }

            post {
                always {
                    junit 'java-app/target/surefire-reports/*.xml'
                }
            }
        }

        stage('Build') {
            //agent {label 'node2'}
            steps {
                sh '''
                    ./jenkins/build/mvn.sh mvn -B -DskipTests clean package
                    ./jenkins/build/build.sh
                '''
            }

            post {
                success {
                   archiveArtifacts artifacts: 'java-app/target/*.jar', fingerprint: true
                }
            }
        }

        stage('Push') {
            //agent {label 'node2'}
            steps {
                sh './jenkins/push/push.sh'
            }
        }

        stage('Deploy') {
            //agent {label 'node1'}
            steps {
                sh './jenkins/deploy/deploy.sh'
            }
        }
    }
}
