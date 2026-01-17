#!/bin/bash
if [ -f "/etc/os-release" ]; then
    echo "File /etc/os-release exists."
else
    echo "File not found."
fi
