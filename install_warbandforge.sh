#!/bin/bash

# Function to install dependencies
install_dependencies() {
    # Add i386 architecture
    dpkg --add-architecture i386 && \
    # Update apt cache
    apt update && \
    # Upgrade packages
    apt upgrade -y && \
    # Install necessary packages
    apt install -y wget software-properties-common apt-transport-https bsdtar dos2unix && \
    # Add WineHQ repository key
    wget -qO - https://dl.winehq.org/wine-builds/Release.key | apt-key add - && \
    # Add WineHQ repository
    apt-add-repository https://dl.winehq.org/wine-builds/ubuntu/ && \
    # Update apt cache again
    apt update && \
    # Install WineHQ Stable
    apt install -y --install-recommends winehq-stable && \
    # Clean apt cache
    apt clean
}

# Function to install MBW server
install_mbw_server() {
    # Place the commands to install MBW server here
    echo "Installing MBW server..."
}

# Main menu
main_menu() {
    echo "Welcome to the Installation Script"
    echo "Please select an option:"
    echo "1. Install dependencies"
    echo "2. Install MBW server"
    echo "3. Exit"

    read -p "Enter your choice: " choice

    case $choice in
        1) install_dependencies ;;
        2) install_mbw_server ;;
        3) exit ;;
        *) echo "Invalid choice. Please enter a valid option." ;;
    esac
}

# Run main menu
main_menu