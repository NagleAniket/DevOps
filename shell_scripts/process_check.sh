#!/bin/bash
# Script to check if a process is running

# Ask user for process name
read -p "Enter process name to check (e.g., java): " PROCESS

# Count number of processes running
COUNT=$(pgrep -c "$PROCESS")

if [ "$COUNT" -gt 0 ]; then
    echo "✅ $PROCESS is running ($COUNT instance(s))"
else
    echo "❌ $PROCESS is not running"
fi
