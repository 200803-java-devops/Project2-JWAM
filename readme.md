# gimbus2

A pipeline to automate the steps between changing code and deploying an application.

Gimbus 2 is a CI/CD pipeline that works with web applications managed by maven and whose source code is accessible on github. After initial setup it will have a fully automated and responsive continuous integration pipeline for updating a live hosted web application.

## User Stories

As a web application user, I want to have access to the most up to date version of the app, so that I can utilize newer features.
As a developer, I want changes to be integrated and delivered automatically, so that the busywork of doing so manually can be minimized in the development process.
As a developer, I want a damaged build to be caught before deployment and to be notified, so that the problem can be resolved without disrupting the application itself.
As a developer, I want my deployed application to update with new changes, so that the application can maintain maximum uptime while new features, changes, and bug fixes are implemented.

## Components

### gimbus2-jenkins

The base image for all the other server components that use Jenkins. Includes Docker-in-Docker, kubectl, and several plugins (determined by [this list](gimbus2-jenkins/plugins.txt)). The image is located at [alxl/gimbus2-jenkins](https://hub.docker.com/repository/docker/alxl/gimbus2-jenkins) on Docker Hub.

### Build Server

Builds the target project. Developers are alerted about whether or not the build succeeded. If the build is successful, it creates a Docker image of the build and pushes it to Docker Hub. It then triggers the Test Server to begin working.

### Test Server

Pulls the Docker image created by the build server and runs tests on it. Developers are alerted about whether or not the tests pass. If all tests pass, it tells the production server to update the deployed applications.

### Production Server

This server does not use Jenkins. Instead, it holds the live applications at the end of the gimbus2 pipeline. When the code changes for one of them, gimbus2 springs into action to rollout the latest version.
