# \*nix Command Line Tools Configurations

Repository to share configurations betwen unix-like systems.

## Symlink all configs to the HOME folder

The `symlink_configs.sh` script will create symlinks for all configs in this repo in the HOME folder, if any of these configs already exists in the system, a backup will be created in the `backups/` folder of this repo.

```
./symlink_configs.sh
```
