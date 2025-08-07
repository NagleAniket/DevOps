#!/bin/bash
# Script to check service health and restart if not running

# Ask user for service name
read -p "Enter service name to check (e.g., tomcat): " SERVICE

# Check if service is running
if pgrep -x "$SERVICE" > /dev/null
then
    echo "✅ $SERVICE is running"
else
    echo "❌ $SERVICE is not running, restarting..."
    systemctl start "$SERVICE"
    echo "Service $SERVICE restarted"
fi
