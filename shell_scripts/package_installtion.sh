#!/bin/bash

echo "============== PACKAGE INSTALLER SCRIPT =============="

# Prompt user for package name
read -p "Enter the package name to install: " package_name

# Check if the package name is empty
if [ -z "$package_name" ]; then
    echo "❌ Error: No package name provided! Exiting..."
    exit 1
fi

# Check if the package is already installed
if apt list --installed 2>/dev/null | grep -qw "^$package_name/"; then
    echo "✅ Package '$package_name' is already installed."
else
    # Update package lists
    echo "🟡 Updating package lists... (this may take a moment)"
    sudo apt-get update >/dev/null 2>&1

    # Install the package
    echo "🟡 Installing package: $package_name..."
    sudo apt-get install -y "$package_name" >/dev/null 2>&1

    # Check if installation was successful
    if apt list --installed 2>/dev/null | grep -qw "^$package_name/"; then
        echo "✅ Package '$package_name' installed successfully!"
    else
        echo "❌ Installation failed for package '$package_name'. Please check the package name and try again."
        exit 1
    fi
fi

# Display package version
package_version=$(apt show "$package_name" 2>/dev/null | grep -i "Version:" | awk '{print $2}')
if [ -n "$package_version" ]; then
    echo "📦 Installed Version: $package_version"
else
    echo "⚠️ Unable to retrieve package version."
fi

# Check if the package provides a system service and its status
if systemctl list-units --type=service --all | grep -qw "$package_name"; then
    service_status=$(systemctl is-active "$package_name" 2>/dev/null)
    if [ "$service_status" == "active" ]; then
        echo "✅ Package '$package_name' service is running."
    else
        echo "⚠️ Package '$package_name' is installed but the service is not running."
    fi
else
    echo "ℹ️ No active system service found for '$package_name'. It might be a library or utility."
fi

echo "============== INSTALLATION PROCESS COMPLETED =============="

