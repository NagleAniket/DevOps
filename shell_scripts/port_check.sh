#!/bin/bash
# Script to check if a network port is reachable on a host

# Ask user for host and port
read -p "Enter hostname (e.g., google.com or 127.0.0.1): " HOST
read -p "Enter port number (e.g., 443): " PORT

# Use nc (netcat) to check connectivity
nc -zv "$HOST" "$PORT"
if [ $? -eq 0 ]; then
    echo "✅ Port $PORT on $HOST is reachable"
else
    echo "❌ Port $PORT on $HOST is NOT reachable"
fi
