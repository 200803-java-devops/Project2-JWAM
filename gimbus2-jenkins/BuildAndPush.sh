echo "Enter Docker Hub username"
read username
docker build -t $username/gimbus2-jenkins:latest .
docker push $username/gimbus2-jenkins:latest