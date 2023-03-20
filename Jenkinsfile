pipeline {
    agent any

    stages {
        stage('Pull project') {
            steps {
                checkout([$class: 'GitSCM',
                          branches: [[name: '*/main']],
                          doGenerateSubmoduleConfigurations: false,
                          extensions: [],
                          submoduleCfg: [],
                          userRemoteConfigs: [[url: 'https://github.com/tzurpdevops/project1.git']]
                          ])
            }
        }
        stage('Build and Run Docker Image') {
            steps {
		sh "ls"
		script {
		// Build the Docker image
   		docker.build('proj1-app', dockerfile)
		// Run the Docker container
   		def dockerContainer = docker.run('-p 5000:5000 proj1-app')
		}
            }
        }
        stage('Test') {
            steps {
              //  sh "python3 app.py"
              //  sh "echo hello test"
                sh "ls && ls tests/"
                sh "cd tests && ./unittest.sh"
            }
        }
        stage('Deploy') {
            steps {
                sh "echo 'hello deploy'"
            }
        }
    }
}
