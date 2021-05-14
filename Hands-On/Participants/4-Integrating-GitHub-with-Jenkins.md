# Integrating GitHub with Jenkins
- Install GitHub Jenkins plugin
  - Go to Manage Jenkins -> Manager Plugin
  - Search Github Plugin in the Available tab then click on Download now and install after the restart
- Install Maven Plugin
  - Go to Jenkins- Manage Jenkins- Global Tool Configuration, Click OK

-  Integrate Jenkins with GitHub
  - Go to Jenkins- click on System configuration- Go to GitHub section
  - Go to Github Repository- click on settings- Go to webhook and add new webhook
  - Paste the Jenkins Hook URL in the Github webhook

- Creating a Jenkins job
  - Create a new task for Jenkins, click on “New Item”
  - Under the Source Code Management tab, select Git, and then set the Repository URL to point to your GitHub Repository.
  - Now Under the Build Triggers tab, select the “Build when a change is pushed to GitHub” checkbox.
  - Build\Invoke top lavel maven targets
    - Maven Version: 3.3.9
    - Goals: clean package
  - Post Build Actions
    - Files to archive: **/*.war
