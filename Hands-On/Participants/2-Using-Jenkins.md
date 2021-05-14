# Using Jenkins

## Configuring credentials

### Adding new global credentials

 - From the Jenkins home page (i.e. the Dashboard of the Jenkins classic UI), click Manage Jenkins > Manage
 - Under System, click the Global credentials (unrestricted) link to access this default domain.
 - Click Add Credentials on the left.
 - From the Kind field, choose the type of credentials to add.



## Change time zone
 - To see the time zone currently set, go to jenkins_server/systemInfo and see the user.timezone system property.
 - You may want to change the time zone displayed to match your own time zone. By going to your user configuration page, you can set the User Defined Time Zone to match your own.


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
 - Specify when and how your build should be triggered.
  - Poll SCM (Every 15 Min)
    - H/15 * * * *

 - add a build step in the Build section.
    - clean verify
 - Press Save to finish the job definition. Press Build Now
 
