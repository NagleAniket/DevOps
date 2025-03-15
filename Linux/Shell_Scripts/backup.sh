#!/bin/bash

<<help

This scripts take backup
help


echo "============== BACKUP SCRIPT =============="

# Prompt user for source and destination directories
read -p "Enter the source directory path: " source_dir
read -p "Enter the destination directory path: " dest_dir

# Check if source directory exists
if [ ! -d "$source_dir" ]; then
    echo "❌ Error: Source directory '$source_dir' does not exist!"
    exit 1
fi

# Check if destination directory exists, if not create it
if [ ! -d "$dest_dir" ]; then
    echo "🟡 Destination directory '$dest_dir' does not exist. Creating..."
    mkdir -p "$dest_dir"
    echo "✅ Destination directory created successfully."
fi

# Create a timestamped ZIP file name in format backup_YYYYMMDD_HHMMSS.zip
backup_filename="backup_$(date +%Y%m%d_%H%M%S).zip"
backup_filepath="$dest_dir/$backup_filename"

# Perform the backup using zip
echo "🟡 Creating backup..."
zip -r "$backup_filepath" "$source_dir" >/dev/null

# Verify if the backup was successful
if [ $? -eq 0 ]; then
    echo "✅ Backup completed successfully!"
    echo "📂 Backup File: $backup_filepath"
else
    echo "❌ Backup failed!"
    exit 1
fi

echo "============== BACKUP PROCESS COMPLETED =============="

