# Quick Command for Debian (apt)

```sh
# Basic Operations:
sudo apt update                           # Update package lists
sudo apt upgrade                          # Upgrade installed packages
sudo apt install <package_name>           # Install a package (or multiple packages)
sudo apt remove <package_name>            # Remove a package
sudo apt purge <package_name>             # Remove a package and its configuration files
sudo apt autoremove                       # Remove automatically installed dependencies that are no longer needed
sudo apt install ./<package_file>.deb     # Install a package from a local .deb file

# Searching:
apt search <search_term>                  # Search for packages
apt show <package_name>                   # Display information about a package
apt list --installed                      # List installed packages
apt list --upgradable                     # List upgradable packages
apt list --all-versions <package_name>    # List all available versions of a package

# Cleaning and Cache Management:
sudo apt autoclean                        # Remove old downloaded archive files
sudo apt clean                            # Remove all downloaded archive files

# Package Dependencies:
apt depends <package_name>                # Show package dependencies
apt rdepends <package_name>               # Show reverse dependencies

# Specific Package versions:
sudo apt install <package_name>=<version> # Install a specific version of a package
```