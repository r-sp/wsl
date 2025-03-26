# Windows Subsystem for Linux (WSL) - Guidance

This guide shows you how to set up a robust development environment on Windows 11 using [WSL](https://learn.microsoft.com/en-us/windows/wsl/install), featuring [Debian](https://www.debian.org/distrib/) and [Arch Linux](https://archlinux.org/download/). Enjoy the best of both Windows and Linux, with [zsh](https://en.wikipedia.org/wiki/Z_shell), [starship](https://starship.rs/), [fzf](https://github.com/junegunn/fzf) and [zoxide](https://github.com/ajeetdsouza/zoxide) for a streamlined terminal experience.

## Prerequisites

1. Make sure your computer has the Virtualization features enabled in UEFI Settings (some may refer to this as BIOS Settings).

2. Activate and install the needed features and software on your Windows host OS. Open PowerShell in Administrator mode and type these commands:
   ```sh
   dism.exe /online /enable-feature /featurename:Microsoft-Windows-Subsystem-Linux /all /norestart
   dism.exe /online /enable-feature /featurename:VirtualMachinePlatform /all /norestart
   ```
3. Reboot your Windows 11 host.
4. Update your WSL Linux kernel update package. Open PowerShell in administrator mode and enter the following command:
   ```sh
   wsl --update
   ```

See: [How to install Linux on Windows with WSL](https://learn.microsoft.com/en-us/windows/wsl/install).

## Install Debian Linux

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

## Install Arch Linux

1. Find the [`archlinux-bootstrap-*.tar.zst`](https://archlinux.org/download/) via appropriate mirror links.
2. Open your Debian instance and download the Arch Linux Tar file.
   ```sh
   wget <copied link to the tar file>
   ```
3. List the contents and get the name of the downloaded file.
   ```sh
   ls
   ```
4. Extract the Tar file.
   ```sh
   sudo tar -zxvf <downloaded file name>
   ```
5. Thereafter, enter into the extracted folder.
   ```sh
   cd <name of the extracted folder>
   ```
   > `cd root.x86_64`
6. Spot the file on `etc/pacman.d/mirrorlist`. This file holds the list of mirrors.
   ```sh
   sudo nano etc/pacman.d/mirrorlist
   ```
   > After uncommenting some mirrors, save the file using CTRL+O and then exit the editor using CTRL+X.
7. Compress the whole root folder back to the `tar.gz` file. For this, you should be inside the `root.x86_64` directory.
   ```sh
   sudo tar -czvf root.tar.gz *
   ```
   > This will create a compressed file containing the contents of the folder, including the changes you have made to the mirrors file.
8. Move the compressed file to Windows host.
   ```sh
   sudo mv root.tar.gz <name of the Windows folder>
   ```
   > Windows directories are available inside the WSL distribution, and you can access them from `/mnt`.
   ```sh
   sudo mv root.tar.gz /mnt/c/Users/<username>/Downloads/
   ```
   > This will move the tar file into your Downloads folder.
9. Shut down your running Debian instance from PowerShell.
   ```sh
   wsl --shutdown Debian
   ```
10. Import `root.tar.gz` from PowerShell in administrator mode.
    ```sh
    wsl --import <Distro name> <Location to where imported> <Location of the tar file>
    ```
    > This will register Arch Linux to your WSL 2 as custom installation.
    ```sh
    wsl --import ArchLinux C:\Users\<username>\AppData\local\wsl\ArchLinux C:\Users\<username>\Downloads\root.tar.gz
    ```
    > Make sure that you're correctly import and export your Arch Linux file.
11. Check installed WSL distributions to verify that Arch Linux is listed.
    ```sh
    wsl -l -v
    ```
12. Start your Arch Linux instance from PowerShell.
    ```sh
    wsl -d ArchLinux
    ```
    > You should start Arch Linux instance with given distro name.
13. Initialize the Arch Linux keyring.
    ```sh
    pacman-key --init
    pacman-key --populate archlinux
    pacman-key --refresh-keys
    pacman -Sy archlinux-keyring
    ```
    > Please run above commands step by step and wait until it finished.
14. Run system update.
    ```sh
    pacman -Syu
    ```
15. Install the base and other essential packages.
    ```sh
    pacman -Syu base base-devel git nano wget reflector rsync
    ```

16. Set up mirror list.
    - Back up the existing mirror list, in case anything goes weird.
      ```sh
      cp /etc/pacman.d/mirrorlist /etc/pacman.d/mirrorlist.bak
      ```
    - Get a list of [reflector](https://wiki.archlinux.org/title/Reflector) countries and codes.
      ```sh
      reflector --list-countries
      ```
    - Set your mirror list by your country or nearest.
      ```sh
      reflector -c us -f 12 -l 10 --save /etc/pacman.d/mirrorlist
      ```
      > This will set mirror list to US as fastest that meet the order criteria and limit the list to most recently synchronized servers. See: [help message](https://xyne.dev/projects/reflector/).
17. Set up locale or language.
    - Uncomment selected language, `en_US.UTF-8`.
      ```sh
      nano /etc/locate.gen
      ```
    - Generate the locale config in the `etc/` directory.
      ```sh
      locale-gen
      echo LANG=en_US.UTF-8 > /etc/locale.conf
      export LANG=en_US.UTF-8
      ```
18. Creating user root and local.
    - Create password for your root.
      ```sh
      passwd
      ```
    - Create local user.
      ```sh
      useradd -m <username>
      ```
    - Create password for your local user.
      ```sh
      passwd <username>
      ```
    - Gain administrative privileges to your local user.
      ```sh
      usermod -aG wheel <username>
      ```
    - Scroll down and uncomment the `%whell ALL=(ALL:ALL) ALL`.
      ```sh
      EDITOR=nano visudo
      ```
      Save the document using CTRL+O and exit using CTRL+X.
19. Shut down your running Arch Linux instance.
    ```sh
    wsl.exe --shutdown ArchLinux
    ```
20. Start Arch Linux instance with local user.
    ```sh
    wsl ~ -d ArchLinux -u <username>
    ```

See: [Arch Linux Distributions for WSL2](https://itsfoss.com/arch-linux-windows-subsystem/).

## Install Zsh for WSL instances

1. Install with sudo.
   ```sh
   # Debian
   sudo apt install zsh

   # Arch Linux
   sudo pacman -S zsh
   ```
2. Configuring `$PATH`, open nano with following command `nano ~/.zshenv`.
   ```sh
   typeset -U path PATH
   path=(~/.local/bin $path)
   export PATH
   ```
3. Use modern completion system, open nano with following command `nano ~/.zshrc`.
   ```sh
   autoload -Uz compinit && compinit
   ```
4. Initial configuration.
   ```sh
   zsh
   ```
   > This will install and load all plugins included in the `~/.zshrc` file.
5. Make Zsh as your default shell.
   ```sh
   chsh -s /bin/zsh
   ```
6. Reload Zsh after changes.
   ```sh
   source ~/.zshrc
   ```

See: 
- [Zsh - Debian Wiki](https://wiki.debian.org/Zsh)
- [Zsh - ArchWiki](https://wiki.archlinux.org/title/Zsh)

## Install Starship for PowerShell and WSL instances

1. Install with sudo.
   ```sh
   # PowerShell using widget
   winget install starship

   # Debian
   sudo apt install starship

   # Arch Linux
   sudo pacman -S starship

   # Alternative with shell
   curl -sS https://starship.rs/install.sh | sh
   ```
2. Initial configuration.
   - PowerShell
     ```sh
     # ~\Documents\PowerShell\Microsoft.PowerShell_profile.ps1
     Invoke-Expression (&starship init PowerShell)
     ```
     > Open new tab PowerShell to see the effect.
   - Zsh
     ```sh
     # ~/.zshrc
     eval "$(starship init zsh)"
     ```
     > Reload the config by `source ~/.zshrc` to see the effect.
3. Add the following command to the end of the file.

See: [Guide - Starship](https://starship.rs/guide/).

## Install Fuzzy finder for WSL instances

1. Install with sudo.
   ```sh
   # Debian
   sudo apt install fzf

   # Arch Linux
   sudo pacman -S zoxide
   ```
2. Initial configuration.
   ```sh
   # ~/.zshrc
   source <(fzf --zsh)
   ```
   > Reload the config by `source ~/.zshrc` to see the effect.
3. Add the following command to the end of the file.

See: [Guide - fzf](https://github.com/junegunn/fzf).

## Install Zoxide for PowerShell and WSL instances

1. Install with sudo.
   ```sh
   # PowerShell using widget
   winget install zoxide

   # Debian
   sudo apt install zoxide

   # Arch Linux
   sudo pacman -S zoxide
   ```
2. Initial configuration.
   - PowerShell
     ```sh
     # ~\Documents\PowerShell\Microsoft.PowerShell_profile.ps1                                                                                              
     Invoke-Expression (& { (zoxide init --cmd cd powershell | Out-String) })
     ```
     > Open new tab PowerShell to see the effect.
   - Zsh
     ```sh
     # ~/.zshrc
     eval "$(zoxide init --cmd cd zsh)"
     ```
     > Reload the config by `source ~/.zshrc` to see the effect.
3. Add the following command to the end of the file.

See: [Guide - Zoxide](https://github.com/ajeetdsouza/zoxide).
