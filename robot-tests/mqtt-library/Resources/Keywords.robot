*** Settings ***
Library       MQTTLibrary
Library       BuiltIn
Resource     Variables.robot

*** Keywords ***
Publish to MQTT Broker and Disconnect
    [Arguments]    ${broker.uri}=${broker.uri}    ${port}=${broker.port}
    ...            ${client.id}=${client.id}      ${topic}=${topic}
    ...            ${message}=${EMPTY}            ${qos}=0
    ...            ${retention}=${false}
    Connect    ${broker.uri}    ${port}    ${client.id}
    Publish    ${topic}    ${message}    ${qos}    ${retention}
    [Teardown]  Disconnect
