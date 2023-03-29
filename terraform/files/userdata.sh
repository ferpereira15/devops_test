#!bin/bash

apt-get update -y
apt-get install git
curl -fsSL https://get.docker.com -o get-docker.sh 
sudo sh ./get-docker.sh
systemctl start docker
systemctl enable docker
mkdir /tmp/webservice-devopsteste
git clone https://github.com/ferpereira15/devops_test.git /tmp/webservice-devopsteste
cd /tmp/webservice-devopsteste/
docker build . -t web_app 
docker run -d -p 8080:8080 web_app -n web_app