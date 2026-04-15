#!/bin/bash

LOG_FILE="$(dirname "$0")/../logs/deploy.log"

echo "===================================" >> $LOG_FILE
echo "🚀 Deployment started at $(date)" >> $LOG_FILE

# system update
echo "Updating system..." >> $LOG_FILE
sudo apt update -y >> $LOG_FILE 2>&1

# nginx install
echo "Installing Nginx..." >> $LOG_FILE
sudo apt install nginx -y >> $LOG_FILE 2>&1

# nginx start
echo "Starting Nginx..." >> $LOG_FILE
sudo systemctl start nginx >> $LOG_FILE 2>&1

# enable on boot
echo "Enabling Nginx..." >> $LOG_FILE
sudo systemctl enable nginx >> $LOG_FILE 2>&1

# status check
echo "Checking Nginx status..." >> $LOG_FILE
sudo systemctl status nginx >> $LOG_FILE 2>&1

echo "✅ Deployment finished at $(date)" >> $LOG_FILE
echo "===================================" >> $LOG_FILE

echo "Deployment completed! Check logs at logs/deploy.log"
