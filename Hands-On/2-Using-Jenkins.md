# Using Jenkins

## Configuring credentials

### Adding new global credentials

 - From the Jenkins home page (i.e. the Dashboard of the Jenkins classic UI), click Manage Jenkins > Manage Credentials
 - Click (global)
 - Click Add Credentials on the left.
 - From the Kind field, choose the type of credentials to add.



## System Information
 - Manage Jenkins\System Information

## Configure the default port of the Jenkins build server
  - The default port number can be changed in the config file at
 ```
 sudo vim /etc/default/jenkins
 ```
  - Here you can set a different port number, e.g. HTTP_PORT=8082
  - Now you need to restart Jenkins with
 ```
 service jenkins restart
 ```

## Setting up a Jenkins job
 - The build of a project is handled via jobs in Jenkins
 - Select New Item. Afterwards, enter a name for the job and select Freestyle project and press OK.
 - Configure how the source code can be retrieved. If you are for example using Git, enter the URL to the Git repository. If the repository is not public, you may also need to configure the credentials.
  - Github App: https://github.com/atingupta2005/simple-java-maven-app.git
 - Specify when and how your build should be triggered.
  - Poll SCM (Every 15 Min)
    - H/15 * * * *

 - add a build step in the Build section - Schell Script
    - echo "Hello World"
 - Press Save to finish the job definition. Press Build Now