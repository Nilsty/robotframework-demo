*** Settings ***
Documentation  Test example for the MQTT library

Resource  Resources/Keywords.robot

*** Test Cases ***
Example test mqtt
    Publish to MQTT Broker and Disconnect
