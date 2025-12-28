# Proxmox Backup Client scripts and setup

My convenience scripts for using [Proxmox Backup Client](https://pbs.proxmox.com/docs/backup-client.html). 

## Installation

* Clone this repository.
* For convenience, symlink the backup scripts in the `scripts` directory to wherever you want.
  * The included `install.sh` is a crude script will symlink the backup scripts into your `~/bin` directory.
  * It assumes this repository is cloned at `~/git/pbc-scripts`.
* Update your `.bashrc`, `.zshrc`, or other login script to ensure the follow environment variables are set for this system:
  * `PBS_BACKUP_NAME`
  * `PBS_BACKUP_DIRS` (or `PBS_BACKUP_DIR` - same thing)
  * `PBS_NAMESPACE`
  * `PBS_REPOSITORY`
* Optionally set `PBS_PASSWORD` or a related environment variable to avoid being prompted for the password.
  * [Please see this page for more information](https://pbs.proxmox.com/docs/backup-client.html#environment-variables).
* `PBS_BACKUP_DIRS` supports multiple directories as a colon-separated list, for example:
  * `export PBS_BACKUP_DIRS="$HOME/service-data:$HOME/opentofu-db-backup"`
  * Each directory is stored as its own archive named after the directory basename (for example `service-data.pxar`).
* `PBS_BACKUP_NAME` identifies the backup group (visible in snapshot lists) and is independent from the per-directory archive names.

## Scripts

* `pbs-environment.sh`
  * Sets up the environment for the other scripts and logs in.
  * You're unlikely to use this directly unless you only want to login.
* `backup-to-pbs.sh`
  * Backs up the `PBS_BACKUP_DIRS` (or `PBS_BACKUP_DIR`) using the `PBS_BACKUP_NAME` and `PBS_NAMESPACE` specified.
* `list-pbs-snapshots.sh`
  * Lists the known snapshots for the `PBS_BACKUP_NAME` group and `PBS_NAMESPACE` specified.
* `restore-pbs-backup.sh`
  * Restores the specified backup listed by `list-pbs-snapshots.sh`.

## Ansible role

An Ansible role for installing the Proxmox Backup Client and these helpers scripts is available in this repository. It has some customization, but not a lot, as this repository is primarily for myself. Feel free to use it but your mileage may vary.
