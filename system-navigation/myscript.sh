#!/bin/bash
set -euo pipefail
# Script to display a greeting, current directory, and current user

echo "Hello from my script!"
echo "Current directory: $(pwd)"
current_user=$(whoami)
echo "Current user: $current_user"
