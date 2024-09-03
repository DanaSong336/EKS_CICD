pipeline {
    agent any

    environment {
        DOCKER_IMAGE_NAME = "danasong336/my-app"
    }

    stages {
        stage ('Checkout') {
            steps {
                script {
                    checkout([$class: 'GitSCM', branches: [[name: '*/main']], extensions: [[$class: 'SubmoduleOption', disableSubmodules: false, parentCredentials: true, recursiveSubmodules: true, reference: '', trackingSubmodules: true]], userRemoteConfigs: [[credentialsId: 'github', url: 'https://github.com/DanaSong336/EKS_CICD.git']]])

                }
            }
        }
        stage('Docker Version') {
            steps {
                script {
                    // 최신 Git 태그를 가져옵니다.
                    def latestTag = sh(script: "git describe --tags `git rev-list --tags --max-count=1`", returnStdout: true).trim()
                    echo "Latest Git Tag: ${latestTag}"
                    env.LATEST_TAG = latestTag
                }
            }
        }
        stage('Build Docker Image') {
            steps {
                script {
                    // Docker 이미지를 빌드하고 최신 Git 태그로 태그를 지정합니다.
                    sh '''
                        docker build -t ${DOCKER_IMAGE_NAME}:${LATEST_TAG} .
                        docker tag ${DOCKER_IMAGE_NAME}:${LATEST_TAG} ${DOCKER_IMAGE_NAME}:latest
                    '''
                }
            }
        }

        stage('Push Docker Image') {
            steps {
                script {
                    // Docker 이미지를 Docker Hub로 푸시합니다.
                    sh '''
                        docker push ${DOCKER_IMAGE_NAME}:${LATEST_TAG}
                        docker push ${DOCKER_IMAGE_NAME}:latest
                    '''
                }
            }
        }
        
        stage('Deploy to EKS') {
            steps {
                script {
                    sh '''
                        aws eks --region ap-northeast-2 update-kubeconfig --name my-cluster
                        kubectl rollout restart deployment/my-app-deployment
                    '''
                }
            }
        }
    }
}
