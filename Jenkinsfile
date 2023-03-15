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
			]
	      )
            }
        }
	stage('Build and Run Docker Image') {
            steps {
                   sh "sudo docker build -t project1-image"
                   sh "sudo docker run --name project1-container -d -p 50000:50000 project1-image"
		   sh "sudo docker ps" 
            }
        }
        stage('Test') {
            steps {
		sh "python3 app.py"
                sh "echo hello test"
		sh "ls & ls tests/"
		sh "cd tests & ./unittest.sh"
            }
        }
        stage('Deploy') {
            steps {
                sh "echo 'hello deploy'"
            }
        }
    }
}
