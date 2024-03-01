#!/bin/bash

echo "Killing Bluetooth..."
sudo rfkill list
sudo rfkill unblock bluetooth
sudo service bluetooth start
GREEN="\033[0;32m"
echo -e "${GREEN}Restarted Bluetooth"
