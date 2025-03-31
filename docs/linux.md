# Basic Linux Commands

```sh
# Navigation
pwd                                    # Print working directory
cd <directory>                         # Change directory
cd ..                                  # Go up one directory
cd ~                                   # Go to home directory
ls                                     # List files and directories
ls -l                                  # List files with detailed information
ls -a                                  # List all files, including hidden files
ls -lh                                 # List files with human-readable sizes
ls -t                                  # List files sorted by modification time
ls -r                                  # List files in reverse order
ls -R                                  # List subdirectories recursively
find <directory> -name "<file>"        # Find files by name
find <directory> -type d               # Find directories
find <directory> -type f               # Find regular files
find <directory> -size +10M            # Find files larger than 10MB
locate <file>                          # Find files by name using a database
history                                # Show command history

# File Operations
cat <file>                             # Display file content
less <file>                            # View file content page by page
head <file>                            # Display the first few lines of a file
tail <file>                            # Display the last few lines of a file
tail -f <file>                         # Follow file and display new lines as they are added
echo "<text>"                          # Print text to the terminal
echo "<text>" > <file>                 # Write text to a file (overwrite)
echo "<text>" >> <file>                # Append text to a file
cp <source> <destination>              # Copy a file or directory
mv <source> <destination>              # Move or rename a file or directory
rm <file>                              # Remove a file
rm -r <directory>                      # Remove a directory and its contents recursively
mkdir <directory>                      # Create a directory
touch <file>                           # Create an empty file or update its timestamp
chmod <permissions> <file>             # Change file permissions
chown <user>:<group> <file>            # Change file ownership
grep "<pattern>" <file>                # Search for a pattern in a file
grep -r "<pattern>" <directory>        # Search recursively
sed 's/old/new/g' <file>               # Replace text in a file
wc <file>                              # Count lines, words, and characters in a file
diff <file1> <file2>                   # Show differences between two files
tar -czvf <archive>.tar.gz <directory> # Compress a directory to a .tar.gz archive
tar -xzvf <archive>.tar.gz             # Extract a .tar.gz archive

# System Information
uname -a                               # Display kernel information
uptime                                 # Show system uptime
free -m                                # Display memory usage in megabytes
df -h                                  # Display disk space usage in human-readable format
top                                    # Display running processes
htop                                   # Interactive process viewer(if installed)
ps aux                                 # Display all running processes
kill <PID>                             # Terminate a process by its PID
killall <process_name>                 # Terminate processes by name
netstat -tulpn                         # List listening ports
ifconfig                               # Display network interface information (deprecated, use ip)
ip addr                                # Display network interface information
ip route                               # Display routing table
ping <hostname>                        # Test network connectivity
ssh <user>@<host>                      # Securely connect to a remote host
whoami                                 # Display current user
sudo <command>                         # Execute a command with superuser privileges
shutdown -h now                        # Shutdown the system immediately
reboot                                 # Reboot the system
date                                   # Display current date and time
cal                                    # Display a calendar

# User Management
useradd <username>                     # Add a new user
passwd <username>                      # Change a user's password
usermod -aG <group> <username>         # Add a user to a group
userdel <username>                     # Delete a user
groupadd <groupname>                   # Add a new group
groupdel <groupname>                   # Delete a group
```