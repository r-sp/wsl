# Quick Command for Arch Linux (pacman)

```sh
# Basic Operations:
sudo pacman -S <package_name>           # Install a package (or multiple packages)
sudo pacman -R <package_name>           # Remove a package
sudo pacman -Rs <package_name>          # Remove a package and its dependencies
sudo pacman -Rns <package_name>         # Remove a package, its dependencies, and configuration files
sudo pacman -U <package_file>           # Install a package from a local file

# System Updates:
sudo pacman -Syu                        # Synchronize package databases and upgrade installed packages
sudo pacman -Sy                         # Synchronize package databases (without upgrading)
sudo pacman -Su                         # Upgrade installed packages (without syncing)
sudo pacman -Syy                        # Force a refresh of the package databases (useful if they are corrupted)
sudo pacman -Qu                         # Lists packages that have updates available

# Searching:
sudo pacman -Ss <search_term>           # Search for packages in the repositories
sudo pacman -Qs <search_term>           # Search for installed packages
sudo pacman -Si <package_name>          # Display information about a package in the repositories
sudo pacman -Qi <package_name>          # Display information about an installed package
sudo pacman -F <file_name>              # Search for packages that own a specific file
sudo pacman -Fs <search_term>           # Search within files that pacman knows about

# Cleaning and Cache Management:
sudo pacman -Sc                         # Remove unneeded packages from the cache
sudo pacman -Scc                        # Remove all packages from the cache
sudo pacman -Qdt                        # List orphaned packages (dependencies not needed by any installed package)
sudo pacman -Rns $(pacman -Qdtq)        # Remove orphaned packages (Use with caution)
paccache -r                             # Remove all cached packages except for the most recent 3 versions

# Package Groups:
sudo pacman -S <group_name>             # Install a package group
sudo pacman -Si <group_name>            # Display information about a package group

# Specific Package versions:
sudo pacman -S <package_name>=<version> #Install a specific version of a package

# Listing Packages
pacman -Qe                              # List explicitly installed packages
pacman -Qm                              # List foreign installed packages
pacman -Ql <package_name>               # Display the files installed by a package

#Package Tree
pactree <package_name>                  # Display the dependency tree of a package

#Package History
pacman -Qh                              # Shows the history of pacman transactions

#Database integrity check
sudo pacman -Db                         # Checks the package database for integrity
```
