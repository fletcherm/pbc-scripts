#!/usr/bin/env bash

set -u
set -e

export PBC=proxmox-backup-client

if ! command -v "$PBC" >/dev/null 2>&1; then
  echo "Error: $PBC is not installed or not in PATH." >&2
  echo "Please install it following Proxmox's instructions: https://pbs.proxmox.com/docs/installation.html#client-installation"
  exit 1
fi

: "${PBS_BACKUP_NAME:?Variable PBS_BACKUP_NAME not set or empty}"
: "${PBS_NAMESPACE:?Variable PBS_NAMESPACE not set or empty}"
: "${PBS_PASSWORD:?Variable PBS_PASSWORD not set or empty}"
: "${PBS_REPOSITORY:?Variable PBS_REPOSITORY not set or empty}"

if [ -n "${PBS_BACKUP_DIRS:-}" ]; then
  PBS_BACKUP_DIRS_RAW="$PBS_BACKUP_DIRS"
elif [ -n "${PBS_BACKUP_DIR:-}" ]; then
  PBS_BACKUP_DIRS_RAW="$PBS_BACKUP_DIR"
else
  echo "Error: PBS_BACKUP_DIRS or PBS_BACKUP_DIR not set or empty." >&2
  exit 1
fi

IFS=':' read -r -a PBS_BACKUP_DIR_LIST <<<"$PBS_BACKUP_DIRS_RAW"
if [ ${#PBS_BACKUP_DIR_LIST[@]} -eq 0 ]; then
  echo "Error: PBS_BACKUP_DIRS or PBS_BACKUP_DIR must include at least one directory." >&2
  exit 1
fi

PBS_BACKUP_ARCHIVE_NAMES=()
PBS_BACKUP_ARCHIVE_DIRS=()
PBS_BACKUP_ARCHIVE_SPECS=()

for backup_dir in "${PBS_BACKUP_DIR_LIST[@]}"; do
  if [ -z "$backup_dir" ]; then
    continue
  fi

  archive_name="$(basename "$backup_dir").pxar"
  for existing_name in "${PBS_BACKUP_ARCHIVE_NAMES[@]}"; do
    if [ "$existing_name" = "$archive_name" ]; then
      echo "Error: duplicate archive name derived from $backup_dir ($archive_name)." >&2
      exit 1
    fi
  done

  PBS_BACKUP_ARCHIVE_NAMES+=("$archive_name")
  PBS_BACKUP_ARCHIVE_DIRS+=("$backup_dir")
  PBS_BACKUP_ARCHIVE_SPECS+=("${archive_name}:${backup_dir}")
done

if [ ${#PBS_BACKUP_ARCHIVE_SPECS[@]} -eq 0 ]; then
  echo "Error: no backup directories configured." >&2
  exit 1
fi

"$PBC" login
