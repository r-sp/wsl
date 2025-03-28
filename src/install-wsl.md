# Install Windows Subsystem for Linux

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