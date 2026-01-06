#!/bin/bash
# Find all files over 1MB in /var/log, ignoring permission errors
large_files=$(find /var/log -type f -size +1M 2>/dev/null)
count=$(echo "$large_files" | wc -l)
total_size=$(du -ch $(echo "$large_files") 2>/dev/null | grep total | awk '{print $1}')

echo "Found $count large log files"
echo "Total size: $total_size"

