#!/bin/bash

# Update and install system dependencies
# Check if sudo is available, otherwise run directly (assuming root)
if command -v sudo >/dev/null 2>&1; then
    sudo apt-get update
    sudo apt-get install -y python3 python3-pip git
else
    apt-get update
    apt-get install -y python3 python3-pip git
fi

# Install Python dependencies
pip3 install -r requirements.txt

# Prompt for Domain
read -p "Masukkan Domain VPS Anda (contoh: vpn.example.com): " domain_input

if [ -z "$domain_input" ]; then
    echo "Domain tidak boleh kosong. Menggunakan default: localhost"
    domain_input="localhost"
fi

python3 init_domain.py "$domain_input"

echo "Setup complete. Domain configured to $domain_input."
echo "You can run the application with: python3 app.py"
