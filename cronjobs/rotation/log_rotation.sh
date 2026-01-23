#!/bin/bash
LOG_DIR="/home/$(whoami)"
MAX_SIZE=1048576
for log_file in "$LOG_DIR"/*.log; do
    [ -f "$log_file" ] && [ $(stat -c%s "$log_file") -gt $MAX_SIZE ] && mv "$log_file" "${log_file}.old" && touch "$log_file" && echo "$(date): Rotated $log_file" >> "$LOG_DIR/rotation.log"
done
