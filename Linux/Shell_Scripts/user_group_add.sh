#!/bin/bash

echo "============== CREATE OR MODIFY USERS ==============="

read -p "Enter the username: " username
read -p "Enter the password: " password
read -p "Enter the group name: " groupname

# Check if the group exists
if getent group "$groupname" >/dev/null 2>&1; then
    echo "✅ Group '$groupname' already exists."
else
    echo "🟡 Creating group '$groupname'..."
    sudo groupadd "$groupname"
    echo "✅ Group '$groupname' creation completed."
fi

# Check if the user exists
if id "$username" >/dev/null 2>&1; then
    echo "✅ User '$username' already exists."
    
    # Check if the user is already in the group
    if groups "$username" | grep -qw "$groupname"; then
        echo "✅ User '$username' is already a member of '$groupname'."
    else
        echo "🟡 Adding user '$username' to group '$groupname'..."
        sudo usermod -aG "$groupname" "$username"
        echo "✅ User '$username' has been successfully added to group '$groupname'."
    fi
else
    echo "🟡 Creating user '$username'..."
    sudo useradd -m -g "$groupname" "$username"
    echo -e "$password\n$password" | sudo passwd "$username"
    echo "✅ User '$username' creation completed."

    echo "🟡 Adding user '$username' to group '$groupname'..."
    sudo usermod -aG "$groupname" "$username"
    echo "✅ User '$username' has been successfully added to group '$groupname'."
fi

echo "============== PROCESS COMPLETED ==============="

