# Home Assistant Add-on: Daikin MQTT

This is Home Assistant addon wrapper for https://github.com/SmartHomeIntegrationTech/MQTTServices-Daikin

## How to use

1. Create internal configuration file pollingsettings.json (see below)
2. Copy the file to config/daikin folder
3. Install and start the add-on.
4. Configure sensors and switch(es) in your HA `configuration.yaml` to get/set data via MQTT topic. Sorry, there is no autoconfiguration as the MQTTServices-Daikin writes data in homie format (whatever it is), not HomeAssistant one. See my sample below.
5. Configure your dashboards, automations and actions with the sensors.


## Creation of PollingSettings.json

See instructions at https://github.com/SmartHomeIntegrationTech/MQTTServices-Daikin

In short:

1. download daikin-0.0.4.jar to **your own computer**
2. start GUI with `java -jar daikin-0.0.4.jar` 
3. configure Daikin address, MQTT address and inputs and outputs.
4. save data to PollingSettings.json file

## HA configuration.yaml sample

```

switch:
  - platform: mqtt
    unique_id: powerful_warmwater_switch
    name: "Water tank booster"
    state_topic: "homie/daikin-heatingunit/domestichotwatertank/2-operation-powerful"
    command_topic: "homie/daikin-heatingunit/domestichotwatertank/2-operation-powerful/set"
    payload_on: 1
    payload_off: 0
    state_on: 1
    state_off: 0
    optimistic: false
    qos: 1
    retain: true

sensor:
  - platform: mqtt  
    state_topic: "homie/daikin-heatingunit/domestichotwatertank/2-operation-powerful"
    name: "Daikin tank heat boost"

  - platform: mqtt
    state_topic: "homie/daikin-heatingunit/domestichotwatertank/2-operation-power"
    name: "Daikin tank power"

  - platform: mqtt
    state_topic: "homie/daikin-heatingunit/domestichotwatertank/2-operation-operationmode"
    name: "Daikin tank mode"

  - platform: mqtt
    state_topic: "homie/daikin-heatingunit/domestichotwatertank/2-operation-targettemperature"
    name: "Daikin tank target"
    unit_of_measurement: "°C"

  - platform: mqtt
    state_topic: "homie/daikin-heatingunit/domestichotwatertank/2-operation-domestichotwatertemperatureheating"
    name: "Daikin tank heating"
    unit_of_measurement: "°C"

  - platform: mqtt
    state_topic: "homie/daikin-heatingunit/domestichotwatertank/2-sensor-tanktemperature"
    name: "Daikin tank sensor"
    unit_of_measurement: "°C"
        
  - platform: mqtt
    state_topic: "homie/daikin-heatingunit/spaceheating/1-sensor-indoortemperature"
    name: "Daikin heating indoor"
    unit_of_measurement: "°C"
    
  - platform: mqtt
    state_topic: "homie/daikin-heatingunit/spaceheating/1-operation-leavingwatertemperatureoffsetauto"
    name: "Daikin heating offset auto"
    unit_of_measurement: "°C"

  - platform: mqtt
    state_topic: "homie/daikin-heatingunit/spaceheating/1-operation-leavingwatertemperatureoffsetheating"
    name: "Daikin heating offset"
    unit_of_measurement: "°C"
    
  - platform: mqtt
    state_topic: "homie/daikin-heatingunit/spaceheating/1-sensor-leavingwatertemperaturecurrent"
    name: "Daikin heating leaving"
    unit_of_measurement: "°C"

  - platform: mqtt
    state_topic: "homie/daikin-heatingunit/spaceheating/1-unitstatus-activestate"
    name: "Daikin heating state"
    
  - platform: mqtt
    state_topic: "homie/daikin-heatingunit/spaceheating/1-operation-power"
    name: "Daikin heating operation"

  - platform: mqtt
    state_topic: "homie/daikin-heatingunit/spaceheating/1-sensor-outdoortemperature"
    name: "Daikin outside"
    unit_of_measurement: "°C"

```
