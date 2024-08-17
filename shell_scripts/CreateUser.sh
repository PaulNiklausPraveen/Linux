#!/bin/bash

# Check if the script is run as root
if [ "$(id -u)" -ne 0 ]; then
    echo "Please run as root or use sudo."
    exit 1
fi

# Check if username is provided
if [ -z "$1" ]; then
    echo "Usage: $0 username"
    exit 1
fi

USERNAME=$1

# Create the user
useradd -m -s /bin/bash "$USERNAME"

# Set a password for the user
echo "Set a password for the new user:"
passwd "$USERNAME"

# Add the user to the sudo group (optional)
read -p "Add the user to the sudo group? (y/n): " ADD_SUDO
if [ "$ADD_SUDO" = "y" ]; then
    usermod -aG sudo "$USERNAME"
    echo "User $USERNAME added to the sudo group."
fi

echo "User $USERNAME has been created successfully."



# Execute the script with the username as an argument
# sudo ./create_user.sh username
