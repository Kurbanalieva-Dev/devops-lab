pipeline {
    agent any

    stages {
        stage('Checkout') {
            steps {
                echo 'Забираем код из GitHub...'
            }
        }
        stage('Run Health Check') {
            steps {
                echo 'Запуск нашего Bash-скрипта...'
                // Запуск скрипта, который лежит в репозитории
                sh 'chmod +x ./script.sh'
                sh './script.sh'
            }
        }
    }
}
