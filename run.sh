#!/bin/bash

filename="input/eiffel.jpeg"

# Create virtual environment if it doesn't exist
if [ ! -d "venv" ]; then
    python3 -m venv venv
fi

# Activate the virtual environment
source venv/bin/activate

# Upgrade pip only once
if [ ! -f ".pip_upgraded" ]; then
    python -m pip install --upgrade pip && touch .pip_upgraded
fi

# Check if requirements have changed
REQ_HASH=$(sha256sum requirements.txt | cut -d' ' -f1)
if [ ! -f ".req_hash" ] || [ "$REQ_HASH" != "$(cat .req_hash)" ]; then
    echo "Installing requirements..."
    python -m pip install -r requirements.txt
    echo "$REQ_HASH" > .req_hash
else
    echo "Requirements already satisfied. Skipping installation."
fi

# Run the main script
python src/main.py "$filename"
