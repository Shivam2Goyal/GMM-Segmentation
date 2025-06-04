#!/bin/bash

filename="input/butter.jpeg"

# Create virtual environment only if it doesn't exist
if [ ! -d "venv" ]; then
    python3 -m venv venv
fi

# Activate the virtual environment
source venv/bin/activate

# Upgrade pip first
python -m pip install --upgrade pip

# Install requirements using the virtual environment's pip
python -m pip install -r requirements.txt

# Run the main script
python src/main.py "$filename"
