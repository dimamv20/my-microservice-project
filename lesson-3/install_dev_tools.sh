#!/usr/bin/env bash

set -e

echo "Updating package list..."
sudo apt update

install_docker() {
    if command -v docker >/dev/null 2>&1; then
        echo "Docker is already installed."
    else
        echo "Installing Docker..."
        sudo apt install -y docker.io
        sudo systemctl enable docker
        sudo systemctl start docker
    fi
}

install_docker_compose() {
    if docker compose version >/dev/null 2>&1; then
        echo "Docker Compose is already installed."
    elif command -v docker-compose >/dev/null 2>&1; then
        echo "Docker Compose is already installed."
    else
        echo "Installing Docker Compose..."
        sudo apt install -y docker-compose-plugin
    fi
}

install_python() {
    if command -v python3 >/dev/null 2>&1; then
        PYTHON_VERSION=$(python3 -c 'import sys; print(".".join(map(str, sys.version_info[:2])))')
        echo "Python is already installed. Version: $PYTHON_VERSION"
    else
        echo "Installing Python..."
        sudo apt install -y python3 python3-pip
    fi
}

install_django() {
    if python3 -m django --version >/dev/null 2>&1; then
        DJANGO_VERSION=$(python3 -m django --version)
        echo "Django is already installed. Version: $DJANGO_VERSION"
    else
        echo "Installing Django..."
        python3 -m pip install --break-system-packages Django
    fi
}

install_pip() {
    if command -v pip3 >/dev/null 2>&1; then
        echo "pip is already installed."
    else
        echo "Installing pip..."
        sudo apt install -y python3-pip
    fi
}

install_docker
install_docker_compose
install_python
install_pip
install_django

echo "All requested tools are installed."