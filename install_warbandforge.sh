#!/bin/bash

# Function to install dependencies
install_dependencies() {
    # Adiciona a arquitetura i386
    sudo dpkg --add-architecture i386
    # Atualiza a lista de pacotes disponíveis
    sudo apt update
    # Atualiza todos os pacotes instalados para a versão mais recente
    sudo apt upgrade -y
    # Instala pacotes necessários
    sudo apt install -y wget software-properties-common apt-transport-https libarchive-tools dos2unix gnupg2
    # Baixa e adiciona a chave de autenticação do WineHQ
    wget -qO - https://dl.winehq.org/wine-builds/winehq.key
    sudo apt-key add winehq.key
    # Adiciona o repositório do WineHQ
    sudo add-apt-repository 'deb https://dl.winehq.org/wine-builds/ubuntu/ focal main'
    # Atualiza a lista de pacotes novamente para incluir o WineHQ
    sudo apt update
    # Instala o pacote winehq-stable
    sudo apt install -y --install-recommends winehq-stable
    # Limpa o cache dos pacotes baixados
    sudo apt clean
    wine --version
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
