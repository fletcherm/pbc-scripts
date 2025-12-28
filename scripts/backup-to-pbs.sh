#!/usr/bin/env bash

here=$(dirname "$0")
source "$here"/pbs-environment.sh

"$PBC" backup --ns "$PBS_NAMESPACE" "${PBS_BACKUP_ARCHIVE_SPECS[@]}"
