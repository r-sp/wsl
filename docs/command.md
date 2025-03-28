# Common Command Usage for Arch Linux

```sh
# System information
uname -a                          # Display kernel information
lsblk                             # List block devices
df -h                             # Display disk space usage
free -m                           # Display memory usage
top                               # Display running processes
htop                              # Interactive process viewer (if installed)
systemctl status <service_name>   # Check the status of a systemd service
systemctl start <service_name>    # Start a systemd service
systemctl stop <service_name>     # Stop a systemd service
systemctl enable <service_name>   # Enable a systemd service to start on boot
systemctl disable <service_name>  # Disable a systemd service

# File system and navigation
ls                                # List files and directories
cd <directory>                    # Change directory
pwd                               # Print working directory
mkdir <directory>                 # Create a directory
rm <file>                         # Remove a file
rm -r <directory>                 # Remove a directory recursively
cp <source> <destination>         # Copy files or directories
mv <source> <destination>         # Move or rename files or directories
cat <file>                        # Display file contents
less <file>                       # View file contents page by page
nano <file>                       # Edit a file using nano
vi <file>                         # Edit a file using vi/vim
find <directory> -name <filename> # Find files by name
grep <pattern> <file>             # Search for a pattern in a file
chmod <permissions> <file>        # Change file permissions
chown <user>:<group> <file>       # Change file ownership

# Networking
ip a                              # Display network interfaces and addresses
ping <hostname_or_ip>             # Test network connectivity
ssh <user>@<host>                 # Secure shell login
```
