#!/bin/bash
# Script to rotate logs (archive old logs with date)

# Ask user for log file path
read -p "Enter full path of log file (e.g., /var/log/app.log): " LOG_FILE

# Check if log file exists
if [ -f "$LOG_FILE" ]; then
    NEW_NAME="${LOG_FILE}_$(date +%F)"
    mv "$LOG_FILE" "$NEW_NAME"
    touch "$LOG_FILE"
    echo "✅ Log rotated: $NEW_NAME created, new $LOG_FILE ready"
else
    echo "❌ Log file not found!"
fi
