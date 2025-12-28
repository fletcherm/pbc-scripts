#!/usr/bin/env bash

here=$(dirname "$0")
source "$here"/pbs-environment.sh

if [ $# -eq 0 ]; then
  echo 'Must pass in the name of the snapshot. Use `list-pbs-snapshots.sh` to see available snapshots.'
  exit 1
fi

for index in "${!PBS_BACKUP_ARCHIVE_NAMES[@]}"; do
  "$PBC" restore --ns "$PBS_NAMESPACE" "$1" "${PBS_BACKUP_ARCHIVE_NAMES[$index]}" "${PBS_BACKUP_ARCHIVE_DIRS[$index]}"
done
