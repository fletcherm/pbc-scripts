# Proxmox Backup Client scripts and setup

My convenience scripts for using `proxmox-backup-client`: https://pbs.proxmox.com/docs/backup-client.html

## Installation

* Clone this repository.
* For convenience, symlink the backup scripts in this directory to wherever you want.
* Update your `.bashrc`, `.zshrc`, or other login script to ensure the follow environment variables are set for this system:
  * `PBS_BACKUP_NAME`
  * `PBS_BACKUP_DIR`
  * `PBS_NAMESPACE`
  * `PBS_REPOSITORY`
* Optionally set `PBS_PASSWORD` or a related environment variable to avoid being prompted for the password.
  * Please see this page for more information: https://pbs.proxmox.com/docs/backup-client.html#environment-variables

## Descriptions

* `pbs-environment.sh`
  * Sets up the environment for the other scripts and logs in.
  * You're unlikely to use this directly unless you only want to login.
* `backup-to-pbs.sh`
  * Backs up the `PBS_BACKUP_DIR` using the `PBS_BACKUP_NAME` and `PBS_NAMESPACE` specified.
* `list-pbs-snapshots.sh`
  * Lists the known backups for the `PBS_BACKUP_NAME` and `PBS_NAMESPACE` specified.
* `restore-pbs-backup.sh`
  * Restores the specified backup listed by `list-pbs-snapshots.sh`.
