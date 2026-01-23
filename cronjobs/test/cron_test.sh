#!/bin/bash
LOG_FILE="/home/$(whoami)/cron_test.log"
TEST_FILE="/home/$(whoami)/cron_test_output.txt"
log_message() { echo "$(date '+%Y-%m-%d %H:%M:%S'): $1" >> "$LOG_FILE"; }
log_message "Cron test script started"
log_message "USER: $USER"
log_message "HOME: $HOME"
log_message "PATH: $PATH"
log_message "PWD: $PWD"
echo "Cron test executed at $(date)" >> "$TEST_FILE"
UPTIME_INFO=$(uptime)
log_message "System uptime: $UPTIME_INFO"
[ -w "$LOG_FILE" ] && log_message "Log file is writable - OK" || log_message "ERROR: Cannot write to log file"
log_message "Cron test script completed"
