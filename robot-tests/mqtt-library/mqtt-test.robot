*** Settings ***
Documentation  Test example for the MQTT library.
...            This test is connecting to a public MQTT broker,
...            publishes a test message and then disconnects from the broker.

Resource  Resources/Keywords.robot

*** Test Cases ***
Connect and send test message to MQTT broker
    Publish to MQTT Broker and Disconnect
