pipeline{
    agent any
    tools{
        jdk 'jdk17'
        terraform 'terraform'
        nodejs 'node16'
    }
    environment {
        SCANNER_HOME=tool 'sonar-scanner'
        AWS_ACCESS_KEY_ID     = credentials('access_key')
        AWS_SECRET_ACCESS_KEY = credentials('secret_access_key')
        AWS_DEFAULT_REGION    = 'ap-south-1'
    }
    stages {
        stage('clean workspace'){
            steps{
                cleanWs()
            }
        }
        stage('Checkout from Git'){
            steps{
                git branch: 'main', url: 'https://github.com/C1-80471/ditissterraform.git'
            }
        }
        stage('Terraform version'){
             steps{
                 sh 'terraform --version'
                }
        }
        stage("Sonarqube Analysis "){
            steps{
                withSonarQubeEnv('sonar-server') {
                    sh ''' $SCANNER_HOME/bin/sonar-scanner -Dsonar.projectName=Terraform \
                    -Dsonar.projectKey=Terraform '''
                }
            }
        }
        stage('TRIVY FS SCAN') {
            steps {
                sh "trivy fs . > trivyfs.txt"
            }
        }
        stage('OWASP FS SCAN') {
            steps {
                dependencyCheck additionalArguments: '--scan ./ --disableYarnAudit --disableNodeAudit', odcInstallation: 'DP-Check'
                dependencyCheckPublisher pattern: '**/dependency-check-report.xml'
            }
        }

        stage('Terraform init'){
            steps{
                sh 'terraform init --upgrade'
            }
        }
        stage('Terraform plan'){
            steps{
                sh 'terraform plan'
            }
        } 
        stage('Terraform apply'){
            steps{
                sh 'terraform apply --auto-approve'
            }
        } 
    }
}
