echo "Enter Docker Hub username"
read username
docker build -t $username/gimbus2-jenkins:latest $(dirname $0)
docker push $username/gimbus2-jenkins:latest