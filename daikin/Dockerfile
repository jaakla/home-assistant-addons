ARG BUILD_FROM
FROM $BUILD_FROM

# Set shell
SHELL ["/bin/bash", "-o", "pipefail", "-c"]

# Set working dir
WORKDIR /opt/daikin

# Install requirements for add-on
RUN \
  apk add --no-cache \
    openjdk11 \
    \
    && curl -J -L -o /tmp/daikin.jar \
      "https://github.com/SmartHomeIntegrationTech/MQTTServices-Daikin/releases/download/v0.0.4/daikin-0.0.4.jar" \
    \
   && mkdir -p /opt/daikin \
   && cp /tmp/daikin.jar /opt/daikin 

# Python 3 HTTP Server serves the current working dir
# So let's set it to our add-on persistent data directory.


# Copy data for add-on
COPY run.sh /
RUN chmod a+x /run.sh

CMD [ "/run.sh" ]
