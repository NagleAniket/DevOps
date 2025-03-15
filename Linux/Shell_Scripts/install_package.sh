#!/bin/bash


#################################################################################
#                                                                               # 
#	Package Installation Script V1.2 - By Aniket				#
#										#				
#################################################################################

# Prompt user for package name
echo "Enter the package name to install:"
read PACKAGE

# Install package using apt
echo "Installing $PACKAGE using apt..."
sudo apt update && sudo apt install -y $PACKAGE >> /dev/null

echo "$PACKAGE installation completed Successfully!"
