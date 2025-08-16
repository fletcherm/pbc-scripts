#!/usr/bin/env bash

here=$(dirname "$0")
source "$here"/pbs-environment.sh

proxmox-backup-client snapshot list --ns "$PBS_NAMESPACE" host/"$PBS_BACKUP_NAME"
