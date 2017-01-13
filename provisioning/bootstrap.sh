#!/bin/bash

cron="20,50 * * * * ruby $1 > /tmp/ruby.cron.log 2>&1"

cron_escaped=$(echo "$cron" | sed s/\*/\\\\*/g)

crontab -l | grep "${cronescaped}"
if [[ $? -eq 0 ]] ;
  then
    echo "Crontab already exists. Exiting..."
    exit
  else
    sudo mkdir /usr/lib/cron
    sudo touch /usr/lib/cron/cron.deny
    rvm cron setup
    crontab -l > tempcron
    echo "$cron" >> tempcron
    crontab tempcron
    rm tempcron
fi