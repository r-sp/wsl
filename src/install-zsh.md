# Install Zsh for WSL instances

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
