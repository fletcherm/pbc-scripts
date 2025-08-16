#!/usr/bin/env bash

set -x

mkdir -p ~/bin
cd ~/bin || exit

for script in backup-to-pbs.sh list-pbs-snapshots.sh pbs-environment.sh restore-pbs-backup.sh; do
  ln -s ~/git/pbc-scripts/"$script" "$script"
done
