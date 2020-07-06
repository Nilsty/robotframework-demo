# Demo test suite for Robotframework
This project will demo the use of the testing framework [Robotframework](https://robotframework.org/). In particular the [Selenium Library](https://pypi.org/project/robotframework-seleniumlibrary/) is used for UI testing as well as the [Requests Library](https://pypi.org/project/robotframework-requests/) is used for API testing.

## Run test suite in docker
`docker-compose up`
This is using the docker image [ppodgorsek/robot-framework](https://hub.docker.com/r/ppodgorsek/robot-framework) from docker hub.

## Run test suite locally
To run the test suite locally the following needs to be installed:
- Google Chrome
- Chrome Driver
- Python 3
- pip libraries:
  - robotframework
  - robotframework-seleniumlibrary
  - selenium
  - robotframework-requests

After installing all requirements the test suite can be executed with:
`robot --outputdir=./output-local --variable HEADLESS_BROWSER_ENABLED:False robot-tests`

![Test executed](../master/test-executed.png)

## Test report
After the tests have been run the test report can be accessed from the output folder. e.g. output/report.html

## Run test suite on Kubernetes
The file [test-on-k8s.yml](../master/test-on-k8s.yml) contains a definition to run the test suite inside a pod on a kubernetes cluster. 
With the command `kubectl apply -f test-on-k8s.yml`, this repo will be cloned to an "initContainer" and then executed inside the docker image [ppodgorsek/robot-framework](https://hub.docker.com/r/ppodgorsek/robot-framework).

## Working with the Robotframework
Here are a couple of helpful resources when working with the Robotframework.
- [Official website](http://robotframework.org/)
- [User guide](http://robotframework.org/robotframework/latest/RobotFrameworkUserGuide.html)
- [Best practice usage](https://github.com/robotframework/HowToWriteGoodTestCases/blob/master/HowToWriteGoodTestCases.rst)
- [Robotframework Builtin Keyword Definitions](http://robotframework.org/robotframework/latest/libraries/BuiltIn.html#Keywords)
- [Selenium Library Keyword Definitions](http://robotframework.org/SeleniumLibrary/SeleniumLibrary.html)
- [Requests Library Keyword Definitions](http://marketsquare.github.io/robotframework-requests/doc/RequestsLibrary.html)
- [Collection of robotframework-request examples](https://github.com/MarketSquare/robotframework-requests/blob/master/atests/testcase.robot)
