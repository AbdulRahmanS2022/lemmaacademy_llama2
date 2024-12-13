#!/bin/bash

# Exit immediately if a command exits with a non-zero status
set -e

# Helper function to install Docker CE
install_docker() {
  echo "Installing Docker CE..."
  apt-get update
  apt-get install -y \
    ca-certificates \
    curl \
    gnupg \
    lsb-release

  mkdir -p /etc/apt/keyrings
  curl -fsSL https://download.docker.com/linux/$(. /etc/os-release && echo "$ID")/gpg | gpg --dearmor -o /etc/apt/keyrings/docker.gpg

  echo "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/$(. /etc/os-release && echo "$ID") \
    $(lsb_release -cs) stable" | tee /etc/apt/sources.list.d/docker.list > /dev/null

  apt-get update
  apt-get install -y docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin

  echo "Docker CE installation completed."
}

# Helper function to install Docker Compose
install_docker_compose() {
  echo "Installing Docker Compose..."
  curl -L "https://github.com/docker/compose/releases/latest/download/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
  chmod +x /usr/local/bin/docker-compose
  ln -s /usr/local/bin/docker-compose /usr/bin/docker-compose || true
  echo "Docker Compose installation completed."
}

# Helper function to install NVIDIA Container Toolkit
install_nvidia_toolkit() {
  echo "Installing NVIDIA Container Toolkit..."
  curl -fsSL https://nvidia.github.io/libnvidia-container/gpgkey | sudo gpg --dearmor -o /usr/share/keyrings/nvidia-container-toolkit-keyring.gpg \
    && curl -s -L https://nvidia.github.io/libnvidia-container/stable/deb/nvidia-container-toolkit.list | \
    sed 's#deb https://#deb [signed-by=/usr/share/keyrings/nvidia-container-toolkit-keyring.gpg] https://#g' | \
    sudo tee /etc/apt/sources.list.d/nvidia-container-toolkit.list

  # Optionally enable experimental packages
  sed -i -e '/experimental/ s/^#//g' /etc/apt/sources.list.d/nvidia-container-toolkit.list

  # Update package list and install toolkit
  apt-get update
  apt-get install -y nvidia-container-toolkit

  echo "NVIDIA Container Toolkit installation completed."
}

# Clone the repository
clone_repository() {
  echo "Restarting Docker services..."
  systemctl restart docker
  echo "Docker services restarted."

  echo "Cloning the repository..."
  git clone https://github.com/n8n-io/self-hosted-ai-starter-kit.git
  echo "Repository cloned successfully."
}

# Main execution flow
install_docker
install_docker_compose
install_nvidia_toolkit
clone_repository

echo "Setup completed successfully."
