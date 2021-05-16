**Prerequisite:**

Participants should have basic knowledge of Linux scripting

It will be a 70% practical and 30% theory session

Cloud VM is needed with 8 GB RAM and 4 Core processor. OS: Ubuntu: 18.0.4 LTS

**Day 1**

1. Why Jenkins?
1. Current issues which Jenkins can resolve
1. Getting Started with Jenkins
   1. Learning Objective
      1. In this module, you will learn about Jenkins, setting up Jenkins environment on your local setup, terminologies used in Jenkins and creating Jenkins job.
   1. Topics:
      1. Install Jenkins on a local machine
      1. Starting Up with Jenkins
      1. Jenkins Architecture and terms of Jenkins
      1. Overview of Jenkins UI
      1. Creating a Jenkins Job
      1. Configuring a Jenkins job
   1. Hands-On:
      1. Installing the Jenkins setup, create a simple Jenkins job, delete, fail, disable the job
1. Introduction to GIT
   1. What is GIT?
   1. Common commands in GIT
   1. Integrate GIT with Jenkins
   1. Git vs GITHub
   1. Create account on GitHub
   1. Create Repo on GitHub
   1. Clone GitHub repo
1. Plugins and its uses
   1. Learning Objective
      1. In this module, we will learn about various plugins available in Jenkins and their usage. Then we will learn to configure Jenkins to work with other tools, working with maven builds and polling for source code changes
   1. Topics:
      1. Introduction to Plugins
      1. Adding Plugins to Jenkins
      1. Commonly used plugins
      1. Configuring Jenkins to work with java, Git and Maven
      1. Creating a Jenkins Build and Jenkins workspace
      1. Configure Jenkins to check for source code changes periodically.
      1. Working with Maven Build Jobs
   1. Hands-On:
      1. Adding the plugins to the Jenkins job, creating a Jenkins job to check for source code changes, creating maven build jobs



**Day 2**

1. Setting Up Your Build Jobs and Security
   1. Learning Objective
      1. In this module, we will learn to learn to Build Jobs, add the advanced features to Jobs and Security.
   1. Topics:
      1. Creating a Freestyle Build Job
      1. Introduction to Build Triggers and to Build Steps
      1. Pre-and Post-Build Actions: Adding properties and properties files
      1. Running Your New Build Job
      1. Parameterized Builds
      1. Distributed builds
      1. Setting Email notification
      1. Enabling Security in Jenkins
      1. Different Levels of Authentication
      1. Types of Access and Administration of the Access
   1. Hands-On:
      1. Creating Freestyle jobs, demo on security and authorization in Jenkins, sending email notifications, running the Jenkins job
1. Implementing Automated Testing
   1. Learning Objective
      1. In this module, you will learn to setup Jenkins to Implement Automated Testing and publish reports.
   1. Topics:
      1. Introduction
      1. Automating Your Unit and Integration Tests
      1. Configuring Test Reports in Jenkins
      1. Displaying Test Results
      1. Ignoring Tests
      1. Automated Acceptance Test with JUnit
   1. Hands-On:
      1. Unit and integration testing, ignoring the tests, display test results
1. Assignment
   1. Assignments will be assignment to the participants as a homework

**Day 3**

1. Metrics to Improve Quality
   1. Learning Objective
      1. In this module, we shall learn to check for the code coverage and usage of PMD and FindBugs Jenkins plugin and also Jenkins support with other build systems.
   1. Topics:
      1. Looking for foul Code through Code Coverage
      1. Activating and usage of PMD Jenkins plugin
      1. Activating and usage of Findbugs Jenkins plugin
      1. Verifying HTML Validity
      1. Reporting with JavaNCSS
      1. Jenkins with Gradle script build system
      1. Jenkins with shell script build system
   1. Hands-On:
      1. Jenkins plugin for analyzing the bugs, reporting using Jenkins, Jenkins with a different build system
1. Distributed Jenkins Configuration
   1. Learning Objective
      1. In this module, we shall learn to create a distributed Jenkins system to handle concurrent build triggers, we will learn to set up master and slave configuration in Jenkins.
   1. Topics:
      1. Introduction to Distributed Jenkins Build
      1. Configuring Master Jenkins node
      1. Configuring the Jenkins slave
      1. Managing nodes and distributing jobs over nodes
      1. Binding Jobs on the master and slave setup
      1. Labelling the nodes to run a specific job
   1. Hands-On:
      1. Configuring slave node in your Jenkins, adding labels to nodes, managing the nodes



1. Maintain and Use Jenkins
   1. Learning Objective
      1. In this module, we shall learn the Best Practices in Jenkins culture. You will also learn the Do's and Don'ts in Jenkins setup
   1. Topics
      1. How to maintain Jenkins
      1. Do's and Don'ts of Jenkins
      1. Backup of Jenkins and Migrating Jenkins from one server to another.
   1. Hands-On
      1. Backup of Jenkins
1. Assignment
   1. Assignments will be assignment to the participants as a homework



**Day 4**

1. Performing Automated Deployment and Continuous Delivery
   1. Learning Objective
      1. In this module, we shall learn to deploy an application to a web server using Tomcat and understanding pipeline and parallel builds.
   1. Topics
      1. Deployment Overview
      1. Implementing Automated and Continuous Deployment
      1. Deploying an application to an application server
      1. Install and configure tomcat.
      1. Deployment of Simple Java web application using Tomcat.
      1. Jenkins Build Pipeline
      1. Parallel Jenkins build
      1. Achieve generated Artifacts
      1. Jenkins integrations
      1. Scaling Jenkins
   1. Hands-On
      1. Continuous deployment using Jenkins, parallel and pipeline builds, Jenkins integrations
1. Jenkins Pipeline
   1. Learning Objective
      1. In this module, we shall learn to implement a project’s entire build/test/deploy pipeline in a jenkinsFile and create a fully automated Jenkins pipeline
   1. Topics
      1. Overview of Pipeline as code
      1. Overview of Pipeline Plugin
      1. Automated Jenkins Pipeline
   1. Hands-On:
      1. Jenkins pipeline
1. Pipeline as a code
1. Move the infrastructure from one server to another
1. Setting up Environment using Environment variables
1. Case Study: Automate repetitive deployment

**Day 5**

1. Jenkins Tips and Tricks
   1. Global environment variables in Jenkins
   1. Create custom global environment variables
   1. Modify the Jenkins URL
   1. Meet the Jenkins' cron: Learn how to execute Jobs automatically
   1. Learn how to trigger Jobs from external sources: Create a generic user
   1. Troubleshooting: Githooks throwing 403 forbidden errors?
   1. Trigger Jobs from Bash Scripts (No parameters)
   1. Trigger Jobs from Bash Scripts (With Parameters)
1. Introduction to Docker
1. Project/ Case Study: Implement CI/CD with Jenkins Pipeline, Docker and Maven
   1. Learn how to install Docker inside of a Docker Container
   1. Define the steps for Pipeline
   1. Build: Create a Jar for Maven App using Docker
   1. Build: Write a bash script to automate the Jar creation
   1. Build: Create a Dockerfile and build an image with Jar
   1. Build: Create a Docker Compose file to automate the Image build process
   1. Build: Write a bash script to automate the Docker Image creation process
   1. Build: Add scripts to the Jenkinsfile
   1. Test: Test code using Maven and Docker
   1. Test: Create a bash script to automate the test process
   1. Test: Add test script to Jenkinsfile
   1. Create a remote machine to deploy containerized app
   1. Push: Create Docker Hub account
   1. Push: Create a Repository in Docker Hub
   1. Push: Push/Pull Docker images to Repository
   1. Push: Write a bash script to automate the push process
   1. Push: Add push script to Jenkinsfile
   1. Deploy: Transfer some variables to the remote machine
   1. Deploy: Deploy application on the remote machine manually
   1. Deploy: Transfer the deployment script to the remote machine
   1. Deploy: Execute the deploy script in the remote machine
   1. Deploy: Add deploy script to Jenkinsfile
   1. Create a Git Repository to store scripts and the code for the app
   1. Create the Jenkins Pipeline
   1. Modify the path when mounting Docker volumes
   1. Create the Registry Password in Jenkins
   1. Add the private ssh key to the Jenkins container
   1. Add post actions to Jenkinsfile
   1. Execute Pipeline manually
   1. Create a Git Hook to automatically trigger Pipeline
   1. Start the CI/CD process by committing new code to Git!
