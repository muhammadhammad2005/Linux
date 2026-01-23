#!/bin/bash
THRESHOLD=80
LOG_FILE="/home/$(whoami)/disk_monitor.log"
USAGE=$(df / | awk 'NR==2 {print $5}' | sed 's/%//')
if [ "$USAGE" -gt "$THRESHOLD" ]; then
    echo "$(date): WARNING - Disk usage is ${USAGE}% (threshold: ${THRESHOLD}%)" >> "$LOG_FILE"
else
    echo "$(date): OK - Disk usage is ${USAGE}%" >> "$LOG_FILE"
fi
