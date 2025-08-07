#!/bin/bash
# Script to backup a directory

# Ask user for source and destination
read -p "Enter source directory to backup: " SOURCE
read -p "Enter destination backup folder: " DEST

# Create destination folder with current date
DEST_DIR="$DEST/$(date +%F)"
mkdir -p "$DEST_DIR"

# Copy files
cp -r "$SOURCE"/* "$DEST_DIR"/
echo "✅ Backup completed to $DEST_DIR"
