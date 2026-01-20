#!/bin/bash
set -euo pipefail
# Check available disk space in root (/) and warn if below threshold

THRESHOLD=5  # Minimum GB required
avail_space=$(df -BG / | awk 'NR==2 {print $4}' | tr -d 'G')

if [[ "$avail_space" -lt "$THRESHOLD" ]]; then
    echo "Warning: Only ${avail_space}GB remaining in root!"
else
    echo "Disk space OK: ${avail_space}GB available"
fi

