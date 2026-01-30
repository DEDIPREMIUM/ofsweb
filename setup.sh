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

echo "Setup complete. You can run the application with: python3 app.py"
