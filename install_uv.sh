#!/bin/bash

echo "Install sshpass"
sudo apt install sshpass -y
# On macOS and Linux.
echo "Install uv"
curl -LsSf https://astral.sh/uv/install.sh | sh

. $HOME/.local/bin/env

echo "Install Python3.12.11"
uv python install 3.12.11


echo "Create VENV For Python3.12.11"
uv venv -p 3.12.11

echo "Install pip in .venv" 
curl -sS https://bootstrap.pypa.io/get-pip.py | /home/sky/self_ansible/.venv/bin/python3

echo "Enter to .venv"
. .venv/bin/activate

echo "Install Asnible"
pip3 install -r ./reqirements.txt

echo "Leave .venv"
deactivate
