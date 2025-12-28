Role Name
=========

Ansible role to install [fletcherm Proxmox Backup Client scripts](https://github.com/fletcherm/pbc-scripts).

Role Variables
--------------

WARNING: The below was AI generated; will human-ify later (maybe, lol).

All role variables use the `pbc_scripts_` prefix. Key variables include (see `defaults/main.yml` for full list):

- `pbc_scripts_install_client`: Install proxmox-backup-client automatically? (default: true)
- `pbc_scripts_client_is_arm`: Set true to install ARM version, false for Intel (default: false)
- `pbc_scripts_client_suite`: Debian suite to use for binaries (default: trixie)
- `pbc_scripts_client_url_base`: Upstream deb URL base for AMD64
- `pbc_scripts_client_url_base_arm`: Upstream deb URL base for ARM64
- `pbc_scripts_client_version`: PBS client version for AMD64
- `pbc_scripts_client_version_arm`: PBS client version for ARM64
- `pbc_scripts_user`: Target user for installation (default: fletcher)
- `pbc_scripts_group`: Target group for installation (default: fletcher)
- `pbc_scripts_home`: Home directory for user
- `pbc_scripts_repo`: Git repo for scripts
- `pbc_scripts_version`: Git tag/branch to check out
- `pbc_scripts_src_dir`: Where scripts clone to
- `pbc_scripts_bin_dir`: Where scripts are symlinked
- `pbc_scripts_backup_dirs`: Colon-separated list of backup directories for `PBS_BACKUP_DIRS`
- `pbc_scripts_env_dir`: Directory for PBS environment file
- `pbc_scripts_env_file`: PBS environment file path
- `pbc_scripts_install_zsh_extension`: Whether to install Zsh extension (default: true)
- `pbc_scripts_zsh_ext_dir`: Directory for Zsh extensions
- `pbc_scripts_zsh_ext_file`: Zsh extension file for PBS env

You must also set PBS repository environment variables in your environment file as needed.

Idempotency & Caching
---------------------

- Bold behavior: Skips re-download/extract/copy when the installed client matches the desired version.
- Installed version/arch check: runs `{{ pbc_scripts_bin_dir }}/proxmox-backup-client version` and `file -b` to detect architecture; triggers reinstall if version differs or arch mismatches the selected target (arm64 vs amd64).
- Cache: downloads `.deb` to `{{ pbc_scripts_home }}/.cache/pbc-scripts/` and extracts under `extract/<version>_<arch>/`.
- Directory modes: creates `{{ pbc_scripts_bin_dir }}` with `0700`, and `{{ pbc_scripts_env_dir }}` with `0755`.

Additional Variables
--------------------

- `pbc_scripts_force_install`: force re-install even if the same version appears installed (default: false).
- `pbc_scripts_client_deb_checksum`: optional checksum for the downloaded deb (e.g., `sha256:<digest>`). If set, avoids re-downloads when content matches.

Example Playbook
----------------

Including an example of how to use your role (for instance, with variables passed in as parameters) is always nice for users too:

    - hosts: servers
      roles:
         - role: pbc_scripts
           vars:
             # ...override variables as needed


License
-------

Unlicense

Author Information
------------------

* Matt Fletcher
