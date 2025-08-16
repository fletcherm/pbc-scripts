#!/usr/bin/env bash

set -x

REPO_SCRIPTS_DIR=~/git/pbc-scripts/scripts
SCRIPTS="backup-to-pbs.sh list-pbs-snapshots.sh pbs-environment.sh restore-pbs-backup.sh"

for script in $SCRIPTS; do
  if [ ! -f "$REPO_SCRIPTS_DIR/$script" ]; then
    echo "Error: $REPO_SCRIPTS_DIR/$script does not exist. Aborting installation."
    exit 1
  fi
done

mkdir -p ~/bin
cd ~/bin || exit

for script in $SCRIPTS; do
  ln -s "$SCRIPTS_DIR/$script" "$script"
done
