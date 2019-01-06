*** Settings ***
Documentation  Example of an API test using the Requests Library
...            call the API.
...            The first test case valides the response code.
...            The second test case valides the respons time.
...            The third test cases iterates over a json response
...            to filter by a partial string match.

Resource  Resources/Keywords.robot

Suite Setup  Create a Session for API

*** Test Cases ***
Status Check For API
    Response Should Return 200 Code

Response Time Check For API
    Response Time Should Be Less Than 400ms

Retrieve JSON data
    Print company names matching 'Group'
