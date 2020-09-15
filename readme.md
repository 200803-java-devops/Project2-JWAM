This is a demo of a functioning Jenkins server that runs in a docker container built entirely from yaml files.

How To Run:

Build image with docker build

Then run the following command with your image name:

docker run -p 8080:8080 -p 50000:50000 -v "jenkins_home:/var/jenkins_home" IMAGE_NAME
