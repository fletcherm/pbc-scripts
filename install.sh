#!/bin/bash

set -x

cd ~/bin

for script in backup-to-pbs.sh list-pbs-snapshots.sh pbs-environment.sh restore-pbs-backup.sh
do
  ln -s ~/git/pbc-scripts/$script
done
