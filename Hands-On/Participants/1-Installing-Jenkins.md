# Installing Jenkins
## Setup Docker (If required)
- Refer:
  - [Docker Setup Instructions](../6-Docker/001-Setup Docker.md)
## Docker
```
docker network create jenkins
docker run -d --name jenkins-docker --privileged -p 8081:8080 -p 50000:50000 jenkins/jenkins:lts-jdk11
docker logs -f jenkins-docker

docker exec -it jenkins-docker bash
exit
docker exec -it jenkins-docker cat /var/jenkins_home/secrets/initialAdminPassword

Browse to http://localhost:8081
```

## Linux
 - Checking and Installing Java
```
java -version
sudo apt update
sudo apt search openjdk
sudo apt install openjdk-11-jdk
java -version
```


- Add the Jenkins Repository (If required)
```
wget -q -O - https://pkg.jenkins.io/debian/jenkins.io.key | sudo apt-key add -
sudo sh -c 'echo deb http://pkg.jenkins.io/debian-stable binary/ > /etc/apt/sources.list.d/jenkins.list'
```


- Installing Jenkins
```
sudo apt-get -y update
sudo apt install -y jenkins
systemctl status jenkins
sudo systemctl enable jenkins
```

## Windows
 - Download from - https://www.jenkins.io/download/#downloading-jenkins
 - Run the setup

## Set up Jenkins
 - Visit: http://your_ip_or_domain:8080

   - Take password:
     - sudo cat /var/lib/jenkins/secrets/initialAdminPassword
