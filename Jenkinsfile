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
                sh '/bin/bash jenkins/test/mvn.sh mvn test'
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
                    /bin/bash jenkins/build/mvn.sh mvn -B -DskipTests clean package
                    /bin/bash jenkins/build/build.sh
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
                sh '/bin/bash jenkins/push/push.sh'
            }
        }

        stage('Deploy') {
            //agent {label 'node1'}
            steps {
                sh '/bin/bash jenkins/deploy/deploy.sh'
            }
        }
    }
}
