#!/usr/bin/env bash

set -u
set -e

: "${PBS_BACKUP_DIR:?Variable PBS_BACKUP_DIR not set or empty}"
: "${PBS_BACKUP_NAME:?Variable PBS_BACKUP_NAME not set or empty}"
: "${PBS_NAMESPACE:?Variable PBS_NAMESPACE not set or empty}"
: "${PBS_REPOSITORY:?Variable PBS_REPOSITORY not set or empty}"

proxmox-backup-client login
