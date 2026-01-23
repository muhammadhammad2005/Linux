#!/bin/bash
BACKUP_DIR="/home/$(whoami)/backups"
DATE=$(date +%Y%m%d_%H%M%S)
BACKUP_FILE="backup_$DATE.tar.gz"
tar -czf "$BACKUP_DIR/$BACKUP_FILE" --exclude="$BACKUP_DIR" /home/$(whoami)/ 2>/dev/null
cd "$BACKUP_DIR"
ls -t backup_*.tar.gz | tail -n +6 | xargs -r rm
echo "$(date): Backup completed - $BACKUP_FILE" >> /home/$(whoami)/backup_log.txt
