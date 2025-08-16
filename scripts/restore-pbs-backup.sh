#!/usr/bin/env bash

here=$(dirname "$0")
source "$here"/pbs-environment.sh

if [ $# -eq 0 ]; then
  echo 'Must pass in the name of the snapshot. Use `list-pbs-snapshots.sh` to see available snapshots.'
  exit 1
fi

"$PBC" restore --ns "$PBS_NAMESPACE" $1 "$PBS_BACKUP_NAME".pxar "$PBS_BACKUP_DIR"
