FROM jenkins/jenkins:lts
ENV JAVA_OPTS "-Djenkins.install.runSetupWizard=false"
ENV JENKINS_USER admin
ENV JENKINS_PASS admin
EXPOSE 8181
EXPOSE 8080