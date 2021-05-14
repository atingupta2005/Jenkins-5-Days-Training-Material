# Installing Jenkins
## Docker
```
docker network create jenkins
docker run --name jenkins-docker --detach \
  --privileged --network jenkins --network-alias docker \
  --env DOCKER_TLS_CERTDIR=/certs \
  --volume jenkins-docker-certs:/certs/client \
  --volume jenkins-data:/var/jenkins_home \
  --publish 2376:2376 8080:8080 122:22 docker:dind --storage-driver overlay2

docker exec -it jenkins-docker bash
docker logs -f jenkins-docker

Browse to http://localhost:8080
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
```

## Windows
 - Download from - https://www.jenkins.io/download/#downloading-jenkins
 - Run the setup

## Set up Jenkins
 - Visit: http://your_ip_or_domain:8080

   - Take password:
     - sudo cat /var/lib/jenkins/secrets/initialAdminPassword
