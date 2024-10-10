pipeline {
    agent any

    environment {
        BRANCH_DESIRED_STATE = 'origin/main'
        AWS_ACCESS_KEY_ID     = credentials('AWS_ACCESS_KEY_ID')  
        AWS_SECRET_ACCESS_KEY = credentials('AWS_SECRET_ACCESS_KEY')
        AWS_DEFAULT_REGION    = 'us-east-1'
    }

    // Checkout the repository containing the Terraform code
    stages {
        stage('Checkout Code') {
            steps {
                checkout scm
            }
        }

    stage('Terraform Init') {
            steps {
                // Navigate to the 'live' directory and initialize Terraform
                dir('live') {
                    sh '''
                    terraform init
                    '''
                }
            }
        }

        stage('Terraform Plan') {
            steps {
                // Generate an execution plan 
                sh '''
                terraform plan -var-file="../workspace/live.tfvars" -out=plan.out
                '''
            }
        }

        stage('Terraform Apply') {
            steps {
                // Apply the Terraform plan to deploy the infrastructure
                sh '''
                terraform apply -auto-approve plan.out
                '''
            }
        }
    }

    post {
        always {
            // Clean up any leftover state or temporary files
            cleanWs()
        }
        success {
            echo 'Terraform deployment successful!'
        }
        failure {
            echo 'Terraform deployment failed.'
        }
    }
}