# Install Fuzzy finder for WSL instances

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
