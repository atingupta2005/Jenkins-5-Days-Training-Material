# Implementing Automated Testing

## Automating Your Unit and Integration Tests
- Create Maven Project
- Repo URL:
  - https://github.com/atingupta2005/simple-java-maven-app.git
- Add Build Step
  - Invoke Top level Maven Targets
    - Maven Version: Select from Combo Box
    - Goals: -B -DskipTests clean package
 - Add Build Step
    - Maven Version: Select from Combo Box
    - Goals: test
 - Save
 - Build
 - Review the Console Output
 - If error occurs then add environment variable
  - Open Manage Jenkins\Configure System
  - Create a New Global Environment Variable
    - _JAVA_OPTIONS
    - -Djdk.net.URLClassPath.disableClassPathURLCheck=true
 - Open the Job again
 - Build
 - Review the Console Output

## Deploy Jar File locally
 - Review the console output of last Build
 - Copy the path of Jar File
 - Verify the Jar file is available in Jenkins server
 - Add Build Step - Execute Shell and put below code
```
java -jar <path of the jar file>
```
 - Build Job
 - Review Console Output

## Configuring Test Reports in Jenkins
 - Add Build Step


## Displaying Test Results
 - Add Post Build Actions - Publish JUnit test result report
 - Test report XMLs: target/surefire-reports/*.xml
 - Save
 - Open the Jon and review the graph on home page


## Ignoring Tests
Goals: -B -DskipTests clean package

## Archive the artifacts
 - Add Post Build Actions - Archive the artifacts
  - Files to Archive: target/*.jar
  - Excludes:
    - Archive Artifacts only if build is successful: Enable
 - Save
 - Build
 - Open Job Homepage to refer to last successful artifacts


## Automated Acceptance Test with JUnit
 - Refer:
  - https://github.com/education/autograding-example-java
  - https://github.com/springframeworkguru/testing-java-junit5-gradle
 - Will show how to configure Gradle and Jenkins for automated JUnit testing and reporting
 - In order to build a quality gate, we will perform the JUnit tests before we build the executable JAR file
 - We do not want to create JAR files that are not functional
 - Tools used
    - Docker
    - Jenkins
    - JUnit Plug-in
  - Install JUnit Plug-in
  - Install ant, Gradle on Jenkins Server
  - Create a job
  - Specify any one project from GitHub URLs as specified above
  - Add Gradle test Task to Jenkins
    - Build\Invoke Grade Script
      - Tasks: test jar
  - Build
  - Review Console Output
  - Add JUnit Test Result Reporting to Jenkins
    - Install Jenkins JUnit Plugin
    - Configure Jenkins to collect and display the JUnit Test Results
      - Post-build Actions -> Publish JUnit test results report
        - Test Report XMLs: **/build/test-results/test/TEST-*.xml
    - Verify JUnit individual Test Reporting
      - Modify Job to have below Gradle task:
        - Tasks: clean check test jar
  - Build
  - Click on the Tests Result link on the left
  - Verify JUnit Test Trend Reporting
    - On the project’s Status page, a Test Trend graph is automatically added, as soon as there are two or more tests available.
    - For that, click on „Build Now“ on the left for a second time and click ENABLE AUTO REFRESH on the upper right
    - After the second build is complete, the (hopefully) blue Test Result Trend graph is showing up on the project status page