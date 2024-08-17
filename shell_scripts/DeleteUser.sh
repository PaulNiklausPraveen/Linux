#!/bin/bash

# Check if the script is run as root
if [ "$(id -u)" -ne 0 ]; then
    echo "Please run as root or use sudo."
    exit 1
fi

# Check if a username is provided
if [ -z "$1" ]; then
    echo "Usage: $0 username"
    exit 1
fi

USERNAME=$1

# Delete the user
userdel -r "$USERNAME"

# Check if the user was successfully deleted
if [ $? -eq 0 ]; then
    echo "User $USERNAME has been deleted successfully."
else
    echo "Failed to delete user $USERNAME."
    exit 1
fi



# Execute the script with the username you want to delete
# sudo ./delete_user.sh username
