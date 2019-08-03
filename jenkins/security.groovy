#!groovy

import jenkins.model.*
import hudson.security.*
import jenkins.install.InstallState

def instance = Jenkins.getInstance()

def jenkins-user = new File("/run/secrets/jenkins-user").text.trim()
def jenkins-pass = new File("/run/secrets/jenkins-pass").text.trim()

println "--> creating local user 'admin'"
// Create user with custom pass
def user = instance.getSecurityRealm().createAccount(jenkins-user, jenkins-pass)
user.save()

def strategy = new FullControlOnceLoggedInAuthorizationStrategy()
strategy.setAllowAnonymousRead(false)
instance.setAuthorizationStrategy(strategy)

if (!instance.installState.isSetupComplete()) {
  println '--> Neutering SetupWizard'
  InstallState.INITIAL_SETUP_COMPLETED.initializeState()
}

instance.save()
