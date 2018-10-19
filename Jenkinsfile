pipeline {
    agent any
    
    // Do not clone the Repo
    options { skipDefaultCheckout() }

    stages {

        stage('Trigger Followup Builds') {
            parallel {
		
//                // This Stage is always executed
//                stage('Always Job') {
//                    steps {
//                        build(job: 'baumann-successor-build',
//                                parameters: [
//                                string(name: 'BRANCH_NAME', value: env.BRANCH_NAME ?: ""),
//                                string(name: 'CHANGE_ID', value: env.CHANGE_ID ?: ""),
//                                string(name: 'CHANGE_TARGET', value: env.CHANGE_TARGET ?: "")
//                                ])
//                    }
//                }

                // This Stage is executed for Pull Requests
                stage('Pull Request Job') {
                    when {
                        changeRequest() 
                    }
                    steps {
                        build(job: 'jiveX-build-pull-request',
                                parameters: [
                                string(name: 'BRANCH_NAME', value: env.BRANCH_NAME ?: ""),
                                string(name: 'CHANGE_ID', value: env.CHANGE_ID ?: ""),
                                string(name: 'CHANGE_TARGET', value: env.CHANGE_TARGET ?: "")
                                ])
                    }
                }

                // This Stage is executed for normal branch builds
                stage('Branch Job') {
                    when {
                        not { changeRequest() }
                    }
                    steps {
                        build(job: 'jiveX-build-branch',
                                parameters: [ string(name: 'BRANCH_NAME', value: env.BRANCH_NAME ?: "") ],
                                wait: false)
                    }
                }

             }
        }
    }
}
