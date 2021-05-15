# Setting Up Oracle and Maven on Slave

- If required switch to root:
```
su
apt  -y update
```

- Check if Java and maven are already installed?
```
java -version
mvn -v

apt install -y maven
apt install -y openjdk-8-jdk
```

- Create a Jenkins User
```
adduser jenkins --shell /bin/bash
```

- Now, login as jenkins user.
```
su Jenkins
```

- Create a "jenkins_slave" directory under /home/jenkins.
```
mkdir /home/jenkins/jenkins_slave
```

- Setting up Jenkins slaves using ssh keys
- Login to the slave server as a jenkins user.
- Create a .ssh directory and cd into the directory.
```
mkdir ~/.ssh && cd ~/.ssh
```

- Create an ssh key pair using the following command. Press enter for all the defaults when prompted.
```
ssh-keygen -t rsa -C "The access key for Jenkins slaves "
```

- Add the public to authorized_keys file using the following command.
```
cat id_rsa.pub > ~/.ssh/authorized_keys
```

- Now, copy the contents of the private key to the clipboard.
```
cat id_rsa
```
