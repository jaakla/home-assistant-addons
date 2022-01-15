#!/usr/bin/with-contenv bashio


conf_directory="/config/daikin"

if [ ! -d $conf_directory ]
then
    mkdir -p $conf_directory
fi

conf_file=$(bashio::config "conf_file")

java -jar daikin.jar -c $conf_file -p

