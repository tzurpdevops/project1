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
        stage('Test') {
            steps {
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
