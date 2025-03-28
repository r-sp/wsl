# Install Arch Linux

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
