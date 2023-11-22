pipeline {
    agent {
        docker {
            image 'python:latest',
            args '-u root'
        }
    }
    stages {
        stage("deps") {
            steps {
                sh 'pip install requirements.txt'
            }
        }
        
        stage("test") {
            steps {
                sh 'python -m coverage run manage.py test'
            }
        }
        stage("report") {
            steps {
                sh 'python -m coverage xml'
                sh 'python -m coverage html'
                sh 'python -m coverage report'
            }
        }
    }
    post {
        always {
            archiveArtifacts 'htmlcov/*'
            cobertura coberturaReportFile : 'coverage.xml'
        }
    }
}