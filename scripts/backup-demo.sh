#!/usr/bin/env bash
#
# backup-demo.sh
# Demonstrates a simple local backup of a demo directory.
# Creates a timestamped tarball in a backup folder.
# Safe — only backs up files inside the designated demo directory.
#

set -euo pipefail

# Configuration
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
BASE_DIR="$(dirname "${SCRIPT_DIR}")"
SOURCE_DIR="${BASE_DIR}/labs"
BACKUP_DIR="${BASE_DIR}/backup"
TIMESTAMP=$(date +%Y%m%d_%H%M%S)
BACKUP_FILE="${BACKUP_DIR}/demo_backup_${TIMESTAMP}.tar.gz"

echo "========================================"
echo "       Backup Demo"
echo "========================================"
echo ""

# Verify source exists
if [ ! -d "${SOURCE_DIR}" ]; then
    echo "Error: Source directory not found: ${SOURCE_DIR}"
    exit 1
fi

# Create backup directory
mkdir -p "${BACKUP_DIR}"

# Show what will be backed up
echo "Source: ${SOURCE_DIR}"
echo "Backup: ${BACKUP_FILE}"
echo ""
echo "Files to include:"
find "${SOURCE_DIR}" -type f | wc -l | xargs echo "  Count:"
echo ""

# Create tarball
echo "Creating backup..."
tar -czf "${BACKUP_FILE}" -C "${BASE_DIR}" labs/

# Verify
if [ -f "${BACKUP_FILE}" ]; then
    SIZE=$(du -h "${BACKUP_FILE}" | cut -f1)
    echo "Backup created successfully."
    echo "Size: ${SIZE}"
    echo "Location: ${BACKUP_FILE}"
else
    echo "Error: Backup creation failed."
    exit 1
fi

echo ""
echo "========================================"
echo "Backup completed: $(date)"
echo "========================================"
