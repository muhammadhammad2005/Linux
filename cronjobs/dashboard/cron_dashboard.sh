#!/bin/bash
echo "=================================="
echo "    CRON JOB STATUS DASHBOARD"
echo "=================================="
echo "Generated on: $(date)"
echo
echo "Current User Cron Jobs:"
crontab -l 2>/dev/null || echo "No cron jobs found"
echo
echo "Recent Cron Activity (last 10 entries):"
sudo grep CRON /var/log/messages 2>/dev/null | tail -10 || sudo journalctl -u crond --no-pager -n 10 2>/dev/null
echo
echo "Pending 'at' Jobs:"
atq 2>/dev/null || echo "No pending at jobs"
echo
echo "Cron Service Status:"
systemctl is-active crond 2>/dev/null || echo "Unable to check service status"
echo
echo "System Cron Files:"
ls -la /etc/cron* 2>/dev/null | head -10
echo "Dashboard generation completed."
