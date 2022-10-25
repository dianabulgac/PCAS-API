# API Test Automation for GSAFleet.Gov

This Java project API test automation using Junit/Karate framework.

#### Features
- Junit/Karate framework, using Junit 5 and Karate 1.2
- Multi-threaded design utilizing Karate Parallel testing
- Spring JDBC/MySQL connector for data layer to access databases via repository and JDBC Template
- Test executions controlled by Karate tags, allowing possible execution by toggles
- Junit assertions and listener implementations
- Updated Cucumber and Extent test report plus Karate report
- To see all version numbers, refer to pom.xml in the project root directory

#### Feature Files
Feature files will have the Karate scenarios in Gherkin format. They are based on acceptance criteria for the JIRA stories. Every feature files
and their scenarios must have proper Xray tags to correctly link back to the appropriate Jira issues.  The featured files are under src/test/java/gov/gsafleet/feature

#### Test Data
Test data is stored in csv format. Each feature file scenario will have all the data from end to end needed to execute the test within a csv object.

#### Branch naming conventions and merging
1. Please create a feature branch off of develop. As best practice, please avoid combining multiple features into a single branch.
2. Once the implementation is done and UI is ready on dev, run your tests locally against dev or your local setup. The day after STT has passed for the new implementation.
3. Upon successful execution, create a PR for merge to develop.
4. Once develop branch is merged to master, newly added tests will be run on Smoke Test Train and Regression pipelines.

#### Running Tests
From Inteliij IDE

- Run the specific tests feature files using the Karate.Test annotation  above the created method that will return the specific feature file passed down as an argument for Karate.run().relativeTo(getClass())
- Run the entire project using the Karate.Test annotation  above the created method testAll()that will return Karate.run().relativeTo(getClass())that is located in AllFeatureRunner class;

- Add Environment Variables
  Using karate-config.js file under var config function;

- Run using maven command line like below, remember to always add the exclusion tags: @wip, @defect, @ignore and @closed 
 * mvn -Dcucumber.filter.tags="not @wip and not @defect and not @closed and <desired tag>" clean test`
 to change the env to a specific one use this command "qa" for test/ "dev" for development
 * mvn test -Dkarate.env="qa"
 * mvn test -Dkarate.env="qa"
 * mvn test
##### IDE Setup
- Get Gherkin plugin

##### Common Setup
- Pull the latest Karate code from the develop branch (app-selenium)
- Identify the feature file you want to run, and call it in the SpecificRunner from the same package

##### Run tests against Dev environment
- Open src/test/java/gov/gsafleet/AllFeatureRunner.java file in Karate project and set the karate.env value to "dev"

##### Run tests against test environment
- Open src/test/java/gov/gsafleet/AllFeatureRunner.java file in Karate project and set the karate.env value to "qa"
  

