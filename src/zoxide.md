# Install Zoxide for PowerShell and WSL instances

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
