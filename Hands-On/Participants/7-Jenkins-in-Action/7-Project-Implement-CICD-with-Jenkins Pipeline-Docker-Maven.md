# Project: Implement CICD with Jenkins Pipeline Docker and Maven

## Learn how to install Docker inside of a Docker Container
 - Docker is currently not installed in jenkins container
```
docker exec -it -u root jenkins bash
docker ps
exit
```
 - Let's create a new container having docker in it
 - Move inside Resources\pipleline folder
 ```
 cd ~/Jenkins-5-Days-Training-Material/Hands-On/Participants/7-Jenkins-in-Action/Resources/pipeline
```
- Copy Dockerfile and docker-compose.yml to ~/jenkins-data
```
cp Dockerfile-Jenkins-with-docker ~/jenkins-data/
cp Dockerfile-remote-host ~/jenkins-data/
cp docker-compose.yml ~/jenkins-data/
```
 - Build Docker image
```
cd ~/jenkins-data
docker-compose build
docker images | grep docker
```
- Booting up Docker-Compose
```
docker-compose up -d
docker exec -it -u root jenkins bash
```
- Give permission on docker.sock
```
id
exit
sudo chown <id>:<id> /var/docker/docker.sock
docker exec -it -u root jenkins bash
docker ps
```

## Define the steps for Pipeline
- Refer Resource/pipleline/Jenkinsfile


## Build: Create a Jar for Maven App using Docker
 - Refer
  - Resources/pipeline
  - Resources/pipeline/java-app
 - Download docker maven image
```
docker pull maven:3-alpine
docker images
```
 - Create Maven container
```
cd Resources/pipeline
docker run --rm -it -v $PWD/java-app:/app -v /root/.m2/:/root/.m2/ -w /app maven:3-alpine sh
```
- Package app manually
```
ls
mvn package
exit
```

- Modify container creation command to build jar
```
docker run --rm -v $PWD/java-app:/app -v /root/.m2/:/root/.m2/ -w /app maven:3-alpine mvn -B -DskipTests clean package
ls java-app/target/
```

## Build: Write a bash script to automate the Jar creation
- Refer Resources/pipeline/jenkins/build/build.sh
- Move to folder Resources/pipeline
- Run command
```
./jenkins/build/mvn.sh mvn -B -DskipTests clean package
ls java-app/target
```

## Build: Create a Dockerfile and build an image with Jar
- Refer Resources/pipeline/jenkins/build/Dockerfile-java
- Move to folder Resources/pipeline/jenkins/build/
- Copy jar file from target directory to Resources/pipeline/jenkins/build/
```
  cp ../../java-app/target/my-app-1.0-SNAPSHOT.jar .
```
- Build Docker image
```
docker build -f Dockerfile-java -t test .
docker images
```
- Verify that the image is there in the image we built. For that we need to create a container to check
```
docker run --rm -it test sh
ls /app
exit
```
- Run jar file in the container
```
docker run -d test
docker logs -f <container id>
```

## Build: Create a Docker Compose file to automate the Image build process
- Refer
  - Resources/pipeline/jenkins/build
  - Resources/pipeline/jenkins/build/docker-compose-build.yml
- Build image using Docker compose
```
cd ./Resources/pipeline/jenkins/build/
export BUILD_TAG=1
docker-compose -f docker-compose-build.yml build
```

## Build: Write a bash script to automate the Docker Image creation process
- Refer:
  - Resources/pipeline/jenkins/build
  - Resources/pipeline/jenkins/build/docker-compose-build.yml
  - Resources/pipeline/jenkins/build/build.sh
- Move to the Resources/pipeline folder
- Run build.sh to Build Image
```
cd ./Resources/pipeline/jenkins/build/
./build.sh
```

## Build: Add scripts to the Jenkinsfile
- Refer:
  - Resources/pipeline/jenkins/build
  - Resources/pipeline/Jenkinsfile
- Refer build stage commands in Jenkinsfile


## Test: Test code using Maven and Docker
- Refer
  - Resources/pipeline/jenkins/test/mvn.sh
- Command to test
  ```
  docker run --rm -v $PWD/java-app:/app -v /root/.m2/:/root/.m2/ -w /app maven:3-alpine mvn test
  ```

## Test: Create a bash script to automate the test process
- Refer
  - Resources/pipeline/jenkins/test/mvn.sh
- Modify path of workspace folder in mvn.sh
- Run script for test
```
./jenkins/test/mvn.sh mvn test
```

## Test: Add test script to Jenkinsfile
- Refer:
  - Resources/pipeline/jenkins/test
  - Resources/pipeline/Jenkinsfile
- Notice the stage - Test having the code to run the tests


## Create a remote machine to deploy containerized app
- Create a new Ubuntu VM
- Install Docker
- Install docker-compose
- Create a user in new VM:
```
sudo useradd prod-user
```
- Switch to Jenkins Server and create a SSH key for New VM
```
cd
ssh-keygen -f prod
ll
cat prod
cat prod.pub
chmod 400 prod
```
- Switch to new VM and add SSH public key to it
```
cd
sudo su
su prod-user
cd /home/prod-user
mkdir .ssh
chmod 700 .ssh/
vi .ssh/authorized_keys
# Copy content of prod.pub from Jenkins server and paste here
chmod 400 .ssh/authorized_keys
exit
```
- Switch to Jenkins Server and connect to new VM using SSH key
```
ssh -i prod prod-user@<ip-of-new-vm>
exit
```


## Push: Create Docker Hub account
- Visit: hub.docker.com and Sign Up
- Activate account by confirming on the email received

## Push: Create a Repository in Docker Hub
- Click Create Repository in Docker Hub portal


## Push: Push/Pull Docker images to Repository
- Login to Docker in jenkins server terminal, tag and push image
```
docker login
docker images
docker tag app:1 atingupta2005/maven-project:1
docker push atingupta2005/maven-project:1
```
- Verify Repo in Docker Hub Portal
- On prod-vm pull the image
```
docker pull atingupta2005/maven-project:1
```

## Push: Write a bash script to automate the push process
- Refer:
  - Resources/pipeline/jenkins/push/push.sh
- Specify login id in file - Resources/pipeline/jenkins/push/push.sh
- Set environment variables
  ```
  export BUILD_TAG=1
  export PASS=<your-docker-login-password>
  ```
- Run the push script
```
sh Resources/pipeline/jenkins/push/push.sh
```


## Push: Add push script to Jenkinsfile
- Refer:
  - Resources/pipeline/Jenkinsfile
- Notice the stage - push having the code to push the image


## Deploy: Transfer some variables to the remote machine
- Refer:
  - Resources/pipeline/jenkins/deploy/deploy.sh
  - Resources/pipeline/jenkins/deploy/publish.sh
- Specify <prod-vm-ip> in file - Resources/pipeline/jenkins/deploy/deploy.sh
- Specify private key path in file - Resources/pipeline/jenkins/deploy/deploy.sh for scp command
- Specify docker login id in file - Resources/pipeline/jenkins/deploy/publish.sh

## Deploy: Deploy application on the remote machine manually
- Refer:
  - Resources/pipeline/jenkins/build
- Connect to Jenkins server
- Move to Resources/pipeline
- Run commands
```
export BUILD_TAG=<any build id>
./jenkins/build/build.sh
docker images | grep maven
./jenkins/push/push.sh
```
- Open Docker Hub portal and validate image is pushed or not
- Move to Resources/pipeline/jenkins/deploy
- Run commands
```
./deploy.sh
```
- Connect to prod-vm
- Verify that file is created
```
cat /tmp/.auth
```
- Now let's deploy the Docker Image manually
```
cd
mkdir maven
vim docker-compose.yml
  version: '3'
  services:
    maven:
      image: "atingupta2005/$IMAGE:$TAG"
      container_name: maven-app
export IMAGE=$(sed -n '1p' /tmp/.auth)
export TAG=$(sed -n '2p' /tmp/.auth)
export PASS=$(sed -n '3p' /tmp/.auth)
docker login -u atingupta2005 -p $PATH
docker-compose up -d
docker logs -f maven-app
```

## Deploy: Transfer the deployment script to the remote machine
- Refer:
  - Resources/pipeline/jenkins/deploy/publish.sh
  - Resources/pipeline/jenkins/deploy/deploy.sh
- Specify docker login id in file - Resources/pipeline/jenkins/deploy/publish.sh
- deploy.sh is having commands to transfer publish.sh to prod-vm
- Move to Resources/pipeline
- Run deploy.sh to transfer pusblish.sh and .auth files to prod-vm
```
./jenkins/deploy/deploy.sh
```
- Run command on prod-vm.
```
cd ~/maven
chmod 777 publish.sh
./publish.sh
```

## Deploy: Execute the deploy script in the remote machine
- Refer:
  - Resources/pipeline/jenkins/deploy/publish.sh
  - Resources/pipeline/jenkins/deploy/deploy.sh
- The last line in deploy.sh is to execute command on prod-vm
- Move to Resources/pipeline
- Run deploy.sh
```
./jenkins/deploy/deploy.sh
```

## Deploy: Add deploy script to Jenkinsfile
- Refer:
  - Resources/pipeline/Jenkinsfile
- Notice the command in the stage - deploy

## Create/Form a Git Repository to store scripts and the code for the app
- Refer
  - https://github.com/atingupta2005/pipeline-maven.git
- Fork the Repository
- Copy the URL of the forked Repo. It's needed while creating the Jenkins pipeline next

## Create the Jenkins Pipeline
- Create a Jenkins pipeline named - pipeline-docker-maven
- Project type should be - Pipeline
- In Pipeline configuration
  - From combo box chose - Pipeline script from SCM
  - Specify Pipeline(pipeline-maven) Repo URL
- Save
- Build
- Open shell of Jenkins server and refer to workspaces
  - move to directory - /home/jenkins/jenkins-data/jenkins_home/workspaces/pipeline-docker-maven
  - Review the files in this directory
  - Code is downloaded in this directory

## Modify the path when mounting Docker volumes
- Note the full path of your workspace folder. It should be in this format:
  - /home/jenkins/jenkins-data/jenkins_home/workspace/pipeline-docker-maven
- We might need to modify mvn.sh to Specify the path for environment variable - WORKSPACE
  - Refer - Resources\pipeline\jenkins\build\mvn.sh
  - Refer - Resources\pipeline\jenkins\test\mvn.sh
- Commit and push the changes

## Create the Registry Password in Jenkins
- We will create password for Docker registry in Jenkins
- The is PASS environment variable which is being used in our pipeline script but it's not defined anywhere
- So let's create password in Jenkins
- Open Jenkins\Credentials
- Create a new Global Credential
  - Kind: Secret Text
  - Scope: Global
  - Secret: <password-for-docker-hub>
  - ID: registry-pass
- Modify Jenkinsfile to extract password from Jenkins server
  - We have already done this
  - Refer to the section - environment in Jenkinsfile
- Commit and push the changes
  - It's not required as Jenkinsfile is already updated

## Add the private ssh key to the Jenkins container
- We might have saved our Private key to connect to the prod-vm in the host machine
- We need to save it to Jenkins server - /opt/prod
- Run below command from host VM
```
docker cp ~/prod jenkins:/opt/prod
```
- Now connect to prod-vm from jenkins server container using the private key
```
ssh -i /opt/prod prod-user@prod-vm
exit
```

## Add post actions to Jenkinsfile to save Archive Artifacts and publish test report
- Refer:
  - Resources/pipeline/Jenkinsfile
- We have already modified Jenkinsfile to put the post action
- Refer the post action in Build and Text stages of Jenkinsfile

## Execute Pipeline manually
- Open Jenkins Pipeline - pipeline-docker-maven
- Click on Build
- Review Console Output
- Resolve if there are any errors
- If pipeline ran successful
    - Confirm if artifacts are there on pipeline homepage
    - Login to prod-vm and confirm docker container is created there
```
docker images
docker ps -a
docker logs <container-id>
```
- Also review the entire log of Console output in Jenkins last build

## Create a Git Hook to automatically trigger Pipeline
- Now whenever we do code push to github, we need to trigger pipeline automatically
- We have already done that for another repo, follow the same steps on our github repo
- We need to add hook in GitHub repo - pipeline-maven

## Start the CI/CD process by committing new code to Git!
- Do changes in the code in GitHub repo - pipeline-maven
- Notice that pipeline will now trigger automatically
- Verify a new docker container is created in prod-vm
