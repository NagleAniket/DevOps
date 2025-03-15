#!/bin/bash

# Directory and user input
DIR=$1
USER=$2

if [ -z "$DIR" ] || [ -z "$USER" ]; then
    echo "Usage: $0 <directory> <username>"
    exit 1
fi

echo "Checking permissions of '$DIR' for user '$USER'..."

# Check if the user has read, write, and execute permissions
sudo -u "$USER" test -r "$DIR" && echo "Read: ✅ Yes" || echo "Read: ❌ No"
sudo -u "$USER" test -w "$DIR" && echo "Write: ✅ Yes" || echo "Write: ❌ No"
sudo -u "$USER" test -x "$DIR" && echo "Execute: ✅ Yes" || echo "Execute: ❌ No"
