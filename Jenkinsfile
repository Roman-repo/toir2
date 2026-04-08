pipeline {

  agent {
    label "${env.agent}"
  }

  options {
    skipDefaultCheckout(true)
    buildDiscarder(logRotator(numToKeepStr: '10'))
  }

  environment {
        scannerHome = tool 'sonar-scanner'
        GITLAB_URL = "https://gitlab.sodru.com"
        PROJECT_ID = "258"
        // GitLab передаёт хеш коммита в переменной 'gitlabAfter' или 'gitlabMergeRequestLastCommit'
        COMMIT_SHA = "${env.gitlabMergeRequestLastCommit}"
  }

  stages {
  
    stage('Checkout')
    {
        
            options {
                timeout(time: 10, unit: 'MINUTES')
            }
        
            steps 
            {
           
                script {

                // Установка статуса 
                withCredentials([string(credentialsId: 'GitlabToken', variable: 'GITLAB_TOKEN')]){          
            
                def statusParams = [
                  gitlabUrl: env.GITLAB_URL,
                  projectId: env.PROJECT_ID,
                  token: GITLAB_TOKEN,  
                  commitSha: env.COMMIT_SHA,
                  state: "running",
                  name: "Jenkins",
                  targetUrl: env.BUILD_URL,
                  description: "Build running"
                ]
        
                setGitlabStatus(statusParams)
                }

              }
              
              timestamps
                {
                    
                    checkout changelog: true, poll: true, scm: [
                    $class: 'GitSCM',
                    branches: [[name: "origin/${gitlabSourceBranch}"]],
                    extensions: [[$class: 'CleanBeforeCheckout']],
                    userRemoteConfigs: [[ credentialsId: "${env.jenkinsGitCredentialsID}", name: 'origin', url: "${env.RemoteGitRepo}"]]
                    ]
                    
                }           
                
            }

        }

      
    stage('CI. Анализ MR проекта. Sonarqube') {
    
      options{
        timeout(time: 120, unit: 'MINUTES')
      }
          
      when{expression{mergeRequest()}}

      steps {
        
        timestamps {
          script {    
            
            def configurationVersion = projectVersion()
            sonarCommand = "${scannerHome}/bin/sonar-scanner -Dproject.settings=${env.PathToSonarPropety} -Dsonar.projectVersion=${configurationVersion} -Dsonar.pullrequest.key=${gitlabMergeRequestIid} -Dsonar.pullrequest.branch=${gitlabSourceBranch} -Dsonar.pullrequest.base=${gitlabTargetBranch}"
          
          }
          
          withSonarQubeEnv(credentialsId: "${env.sonarCredId}", installationName: "${env.sonarInstallationId}") {
            cmd("""
              @SET ${env.SONAR_SCANNER_OPTS}
              ${sonarCommand}
              """)    
            }
          }
        }
      }
      
      stage('CI. Анализ ветки проекта. Sonarqube') {
    
      options{
        timeout(time: 120, unit: 'MINUTES')
      }
    
      environment {
        scannerHome = tool 'sonar-scanner'
      }
      
      when{not{expression{mergeRequest()}}}

      steps {
        timestamps {
          script {
            def configurationVersion = projectVersion()
            sonarCommand = "${scannerHome}/bin/sonar-scanner -Dproject.settings=${env.PathToSonarPropety} -Dsonar.projectVersion=${configurationVersion} -Dsonar.branch.name=${gitlabBranch}"
          }

          withSonarQubeEnv(credentialsId: "${env.sonarCredId}", installationName: "${env.sonarInstallationId}") {
            cmd("""
              @SET ${env.SONAR_SCANNER_OPTS}
              ${sonarCommand}
              """)    
            }
          }
        }

      }
      

      stage("CI. Порог качества") {
      
        options{
          timeout(time: 120, unit: 'MINUTES')
        }
        steps {
          //sleep(60)

          catchError(buildResult: 'UNSTABLE', stageResult: 'FAILURE') {
          
            timeout(time: 2, unit: 'HOURS') {
              // Parameter indicates whether to set pipeline to UNSTABLE if Quality Gate fails
              // true = set pipeline to UNSTABLE, false = don't
              waitForQualityGate abortPipeline: true
            }
            
          }
        }
      }
    }
  
    post {
        success {
            script {
                echo "Сборка УСПЕШНА!"
                // Установка статуса 
                withCredentials([string(credentialsId: 'GitlabToken', variable: 'GITLAB_TOKEN')]){          
            
                def statusParams = [
                  gitlabUrl: env.GITLAB_URL,
                  projectId: env.PROJECT_ID,
                  token: GITLAB_TOKEN,  
                  commitSha: env.COMMIT_SHA,
                  state: "success",
                  name: "Jenkins",
                  targetUrl: env.BUILD_URL,
                  description: "Build success"
                ]
        
                setGitlabStatus(statusParams)
              }
            }
        }
        failure {
            script {
                echo "Сборка ПРОВАЛЕНА!"
                // Установка статуса 
                withCredentials([string(credentialsId: 'GitlabToken', variable: 'GITLAB_TOKEN')]){          
            
                def statusParams = [
                  gitlabUrl: env.GITLAB_URL,
                  projectId: env.PROJECT_ID,
                  token: GITLAB_TOKEN,  
                  commitSha: env.COMMIT_SHA,
                  state: "failed",
                  name: "Jenkins",
                  targetUrl: env.BUILD_URL,
                  description: "Build failed"
                ]
        
                setGitlabStatus(statusParams)
            }
        }
     }
    }
  
}
  
def cmd(command)
{
    if (isUnix())
    {
        sh "${command}"
    } 
    else 
    {
        //bat "chcp 65001\n${command}" 
        bat "${command}" 
    }
}

def mergeRequest()
{
   return env.gitlabMergeRequestIid != null
}

def projectVersion()
{
  def configurationText = readFile encoding: 'UTF-8', file: "${env.PathConfigurationFile}"
  def configurationVersion = (configurationText =~ /<[V,v]ersion>(.*)<\/[V,v]ersion>/)[0][1]
  return configurationVersion
}

def setGitlabStatus(Map params) {
    def validStates = ['pending', 'running', 'success', 'failed', 'canceled']
    if (!(params.state in validStates)) {
        error "Недопустимый статус: ${params.state}. Допустимые значения: ${validStates}"
    }

    // Используем withCredentials внутри функции для полной безопасности
    withCredentials([string(credentialsId: 'GitlabToken', variable: 'INTERNAL_TOKEN')]) {
        def curlCommand = """
            curl -X POST \
                 --header "PRIVATE-TOKEN: ${INTERNAL_TOKEN}" \
                 "${params.gitlabUrl}/api/v4/projects/${params.projectId}/statuses/${params.commitSha}" \
                 --form "state=${params.state}" \
                 --form "name=${params.name}" \
                 --form "target_url=${params.targetUrl}" \
                 --form "description=${params.description}" \
                 --insecure  # Только для тестовых сред!
        """.stripIndent()

        def result = sh(
            script: curlCommand,
            returnStdout: true
        )
        echo "Статус установлен: ${result}"
    }
}
