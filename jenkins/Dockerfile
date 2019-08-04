FROM jenkins/jenkins:lts-alpine

ENV JAVA_OPTS="-Djenkins.install.runSetupWizard=false"

#COPY security.groovy /usr/share/jenkins/ref/init.groovy.d/security.groovy
COPY timezone.groovy /usr/share/jenkins/ref/init.groovy.d/
COPY plugins.txt /usr/share/jenkins/ref/plugins.txt
COPY jenkins.yaml /usr/share/jenkins/ref/jenkins.yaml

RUN mkdir -p /usr/share/jenkins/ref/users
COPY users.xml.override /usr/share/jenkins/ref/users
COPY eman2_9006950017624574913/ /usr/share/jenkins/ref/users/eman2_9006950017624574913/

RUN /usr/local/bin/install-plugins.sh < /usr/share/jenkins/ref/plugins.txt

