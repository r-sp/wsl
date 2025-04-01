# Install Debian

1. Going forward we are in usermode. So you must open normal PowerShell without administrator mode for the steps in this section.
2. Set WSL 2 as you default WSL version. This is a per-user setting in Windows.
   ```sh
   wsl --set-default-version 2
   ```
3. Install Debian.
   ```sh
   wsl --install Debian
   ```
   > This takes some time...
4. Set a `username` and `password` for your Debian Linux installation when prompted.
   > You are now logged in to your Debian system in command line mode.
5. Add some text to the file `/etc/wsl.conf` to activate systemd mode on next boot of WSL 2.
   ```sh
   sudo echo '
   [boot]
   systemd=true' >> /etc/wsl.conf
   ```
   > Provide the user password you set in the previous step when prompted.
6. Verify the content of the file `/etc/wsl.conf` and correct any errrors. There should be only one section `[boot]` and exactly one instance of the line `systemd=true` in it.
   ```sh
   sudo editor /etc/wsl.conf
   ```
   > You could also use `sudo nano /etc/wsl.conf`.
7. Exit to PowerShell.
   ```sh
   logout
   ```
8. Shut down your Debian instance from PowerShell.
   ```sh
   wsl --shutdown -d Debian
   ```
   > To check current running WSL instance `wsl -l -v`
9. Start your Debian instance and log back in.
   ```sh
   wsl -d Debian -u <username>
   ```
10. Use `apt` to upgrade your WSL 2 Debian.
    ```sh
    sudo apt update
    sudo apt upgrade
    ```

See: [Debian Distributions for WSL2](https://wiki.debian.org/InstallingDebianOn/Microsoft/Windows/SubsystemForLinux)
