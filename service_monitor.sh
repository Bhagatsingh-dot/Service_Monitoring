#!/bin/bash

# Define variables
SERVICE="httpd"   # Change this to your service (e.g., nginx, sshd)
LOGFILE="/var/log/service_monitor.log"
EMAIL="b0900075@gmail.com"

# Check if the service is running
if systemctl is-active --quiet $SERVICE; then
    echo "$(date): $SERVICE is running fine." >> $LOGFILE
else
    echo "$(date): $SERVICE is DOWN! Restarting..." >> $LOGFILE
    systemctl restart $SERVICE

    # Check if restart was successful
    if systemctl is-active --quiet $SERVICE; then
        MESSAGE="🚨 Alert: $SERVICE was down and has been restarted successfully on $(hostname)."
        echo -e "$MESSAGE" | /usr/bin/mail -s "🚨 Service Restart Alert" $EMAIL
        echo "$(date): $SERVICE restarted successfully!" >> $LOGFILE
    else
        MESSAGE="⚠️ CRITICAL: Failed to restart $SERVICE on $(hostname). Please check immediately!"
        echo -e "$MESSAGE" | /usr/bin/mail -s "⚠️ Service Restart Failed" $EMAIL
        echo "$(date): Failed to restart $SERVICE!" >> $LOGFILE
    fi
fi
