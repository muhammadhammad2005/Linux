#!/bin/bash
set -euo pipefail
# Script to check the current user and provide warnings if running as root

current_user="${USER:-$(whoami)}"

if [[ "$current_user" == "root" ]]; then
    echo "Warning: Running as root. Be cautious!"
else
    echo "Running as user: $current_user"
fi

