def downstreamJob = 'eman-build-test'

job('github-triggers-test') {
    scm {
        git {
            remote { url('https://github.com/cryoem/eman2.git') }
            branches('*/*')
            extensions {
                cleanBeforeCheckout()
                pruneBranches()
            }
        }
    }
    
    triggers {
        githubPush()
    }
    
    steps {
        downstreamParameterized {
            trigger(downstreamJob) {
            parameters {
                    currentBuild()
                    gitRevision()
                }
            }
        }
        
        gitHubSetCommitStatusBuilder {
            contextSource {
                manuallyEnteredCommitContextSource {
                    context('JenkinsCI')
                }
            }
            statusMessage {
                content('Waiting...')
            }
        }
    }
}

job('cron-test') {
    disabled()
    scm {
        git {
            remote { url('https://github.com/cryoem/eman2.git') }
            branches('*/master')
            extensions {
                cleanBeforeCheckout()
                pruneBranches()
            }
        }
    }
    
    triggers {
        cron('TZ=America/Chicago\nH 2 * * *')
    }
    
    steps {
        downstreamParameterized {
            trigger(downstreamJob) {
            parameters {
                    currentBuild()
                    gitRevision()
                }
            }
        }
    }
}
