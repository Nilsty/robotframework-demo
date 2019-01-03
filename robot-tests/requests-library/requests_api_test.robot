*** Settings ***
Documentation  Test to verify that API response meet the expectations when a user
...            call the API.
...            As a Note : At first, I put all three steps into a 1 Test Cases then I
...            seperate it because of response time is not less than 400ms so this cause a
...            failure for that case. So, I seperated 3 small test cases to get Pass result for
...            other cases.

Resource  Resources/Keywords.robot

Suite Setup  Create a Session for API

*** Test Cases ***
Status Check For API
    Response Should Return 200 Code

Response Time Check For API
    Response Time Should Be Less Than 400ms

Retrieve JSON data
    Iteration Should Print Group Companies
