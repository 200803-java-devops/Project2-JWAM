# gimbus2
A pipeline to automate the steps between changing code and deploying an application.
## Components
### gimbus2-jenkins
The base image for all the other server components that use Jenkins. Includes Docker-in-Docker, kubectl, and several plugins (determined by [this list](gimbus2-jenkins/plugins.txt)). The image is located at [alxl/gimbus2-jenkins](https://hub.docker.com/repository/docker/alxl/gimbus2-jenkins) on Docker Hub.
### Build Server
Builds the target project. Developers are alerted about whether or not the build succeeded. If the build is successful, it creates a Docker image of the build and pushes it to Docker Hub. It then triggers the Test Server to begin working.
### Test Server
Pulls the Docker image created by the build server and runs tests on it. Developers are alerted about whether or not the tests pass. If all tests pass, it tells the production server to update the deployed applications.
### Production Server
This server does not use Jenkins. Instead, it holds the live applications at the end of the gimbus2 pipeline. When the code changes for one of them, gimbus2 springs into action to rollout the latest version.