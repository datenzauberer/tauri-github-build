#!/bin/bash

# Exit immediately if a command exits with a non-zero status.
set -e

echo "Starting Tauri ARM64 toolchain setup for Ubuntu 24.04 using pnpm..."

# 1. Update and Upgrade System Packages
echo "Updating and upgrading system packages..."
sudo apt update
sudo apt upgrade -y

# 2. Install Essential System Dependencies
# These are required by Tauri and its underlying libraries like WebKitGTK.
echo "Installing essential system dependencies..."
sudo apt install -y \
    build-essential \
    libwebkit2gtk-4.1-dev \
    libayatana-appindicator3-dev \
    librsvg2-dev \
    curl \
    wget \
    file \
    libssl-dev

# 3. Install Node.js and Corepack
# Corepack is included in modern Node.js versions and helps manage package managers.
echo "Installing Node.js and enabling Corepack..."
curl -fsSL https://deb.nodesource.com/setup_lts.x | sudo -E bash -
sudo apt-get install -y nodejs
corepack enable

# 4. Install Rust and Cargo using rustup
# This is the recommended way to install Rust and it sets up the environment variables.
echo "Installing Rust and Cargo via rustup..."
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh -s -- -y
source "$HOME/.cargo/env"

# 5. Add the ARM64 target to the Rust toolchain
# This is crucial for building for the ARM64 architecture.
#echo "Adding aarch64-unknown-linux-gnu target to Rustup..."
#rustup target add aarch64-unknown-linux-gnu

# 6. Install the Tauri CLI using pnpm (globally)
# Note: While installing locally as a dev dependency is common, for a general setup script, a global install can be convenient.
echo "Installing Tauri CLI globally with pnpm..."
pnpm add -g @tauri-apps/cli

echo "Setup complete! You are now ready to build Tauri apps on this Ubuntu 24.04 ARM64 machine."
echo "You may need to restart your terminal or log out and back in for the changes to take full effect."

sudo apt install git
