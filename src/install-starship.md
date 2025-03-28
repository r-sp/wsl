# Install Starship for PowerShell and WSL instances

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
