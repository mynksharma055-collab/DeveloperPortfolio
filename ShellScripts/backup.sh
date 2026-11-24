
#!/bin/bash

# Author: Your Name
# Purpose: Create compressed folder backup

# Check argument
if [ $# -ne 1 ]; then
    echo "Usage: ./backup.sh <folder>"
    exit 1
fi

SOURCE="$1"

# Check folder exists
if [ ! -d "$SOURCE" ]; then
    echo "Error: Folder does not exist."
    exit 1
fi

# Create backup directory
mkdir -p ~/DeveloperPortfolio_Backups

# Generate timestamp
TIMESTAMP=$(date +"%Y-%m-%d_%H-%M-%S")

BACKUP_FILE="$HOME/DeveloperPortfolio_Backups/backup_${TIMESTAMP}.tar.gz"

# Create compressed backup
tar -czf "$BACKUP_FILE" -C "$(dirname "$SOURCE")" "$(basename "$SOURCE")"

if [ $? -eq 0 ]; then
    SIZE=$(du -h "$BACKUP_FILE" | cut -f1)

    echo "Backup created successfully!"
    echo "File: $BACKUP_FILE"
    echo "Size: $SIZE"

    echo "$(date) - SUCCESS - $BACKUP_FILE" >> "$HOME/DeveloperPortfolio_Backups/backup.log"
else
    echo "Backup failed!"
    echo "$(date) - FAILED - $SOURCE" >> "$HOME/DeveloperPortfolio_Backups/backup.log"
    exit 1
fi
