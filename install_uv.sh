#!/bin/bash

echo "Install sshpass"
sudo apt install sshpass -y
# On macOS and Linux.
echo "Install uv"
curl -LsSf https://astral.sh/uv/install.sh | sh

. $HOME/.local/bin/env

echo "run uv sync"
uv sync

. ~/.bashrc
