#!/bin/bash

# Check if the user is running the script with root privileges
if [[ $EUID -ne 0 ]]; then
  echo "This script must be run with root privileges. Please use 'sudo'."
  exit 1
fi

# Update package lists
apt-get update

# Install Nginx
apt-get install nginx -y

# Check if Nginx is installed and running
if [[ $(systemctl status nginx | grep active | awk '{print $3}') == "active" ]]; then
  echo "Nginx is installed and running!"
else
  echo "Nginx installation failed or is not running. Please check the logs for errors."
fi

# install node.js
sudo apt-get install nodejs  # For Debian/Ubuntu systems






# Store the current directory
current_dir=$(pwd)

# Change directory to the target directory
pushd micr/express-password-collector

# run npm install
npm install

# run npm install bot
npm install node-telegram-bot-api
npm install @types/node-telegram-bot-api

# Run the command in the target directory
your_command_here

# Pop back to the previous directory
popd


