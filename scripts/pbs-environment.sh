#!/usr/bin/env bash

set -u
set -e

export PBC=proxmox-backup-client

if ! command -v "$PBC" >/dev/null 2>&1; then
  echo "Error: $PBC is not installed or not in PATH." >&2
  echo "Please install it following Proxmox's instructions: https://pbs.proxmox.com/docs/installation.html#client-installation"
  exit 1
fi

: "${PBS_BACKUP_DIR:?Variable PBS_BACKUP_DIR not set or empty}"
: "${PBS_BACKUP_NAME:?Variable PBS_BACKUP_NAME not set or empty}"
: "${PBS_NAMESPACE:?Variable PBS_NAMESPACE not set or empty}"
: "${PBS_REPOSITORY:?Variable PBS_REPOSITORY not set or empty}"

"$PBC" login
