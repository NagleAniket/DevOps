#!/bin/bash

echo "============== DELETE OLD BACKUPS =============="

# Prompt user for the backup directory
read -p "Enter the backup directory path: " backup_dir

# Check if the directory exists
if [ ! -d "$backup_dir" ]; then
    echo "❌ Error: Directory '$backup_dir' does not exist!"
    exit 1
fi

# Find ZIP files older than 15 days
old_files=$(find "$backup_dir" -type f -name "backup_*.zip" -mtime +15)

# Check if any old backup files exist
if [ -z "$old_files" ]; then
    echo "✅ No old backup files found (older than 15 days)."
    exit 0
fi

# Show the files to be deleted
echo "🟡 The following ZIP backup files are older than 15 days and will be deleted:"
echo "$old_files"

# Ask for confirmation
read -p "❗ Are you sure you want to delete these files? Type 'Yes' to confirm or 'No' to cancel: " confirm

# Convert input to lowercase for flexibility
confirm=$(echo "$confirm" | tr '[:upper:]' '[:lower:]')

if [[ "$confirm" == "yes" ]]; then
    # Delete the old backup files
    find "$backup_dir" -type f -name "backup_*.zip" -mtime +15 -exec rm -f {} \;
    echo "✅ Old backup files deleted successfully!"
elif [[ "$confirm" == "no" ]]; then
    echo "❌ Operation aborted by user. No files were deleted."
    exit 0
else
    echo "❌ Invalid input! Please type 'Yes' or 'No'. Operation aborted."
    exit 1
fi

echo "============== CLEANUP PROCESS COMPLETED =============="

