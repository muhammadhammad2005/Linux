#!/bin/bash
set -euo pipefail
# Text processing script for basic system and log analysis

LOG_FILE="system.log"
USERS_FILE="users.txt"

echo "=== System Log Analysis ==="
echo

if [[ ! -f "$LOG_FILE" ]]; then
  echo "Error: $LOG_FILE not found!"
  exit 1
fi

if [[ ! -f "$USERS_FILE" ]]; then
  echo "Error: $USERS_FILE not found!"
  exit 1
fi

echo "SSH Login Analysis:"
echo "Successful logins:"
grep "sshd.*Accepted" "$LOG_FILE" | awk '{print $9, $11}' | sort | uniq -c | sed 's/^[ ]*/  /'
echo

echo "Failed login attempts:"
grep "sshd.*Failed" "$LOG_FILE" | awk '{print $9, $11}' | sort | uniq -c | sed 's/^[ ]*/  /'
echo

echo "=== HTTP Request Analysis ==="
grep "httpd" "$LOG_FILE" | awk '{print $7, $8}' | sort | uniq -c | sed 's/^[ ]*/  /'
echo

echo "=== User Account Summary ==="
echo "Regular users with bash access:"
awk -F: '$3 >= 1000 && $7 ~ /bash/ {print "  " $1 " (" $5 ")"}' "$USERS_FILE"
echo

echo "System accounts:"
awk -F: '$3 < 1000 {count++} END {print "  Total system accounts: " count}' "$USERS_FILE"

