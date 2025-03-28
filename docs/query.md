# Quick Command

```sh
# Config
alias c="clear"                              # Clear all used commands in current terminal
alias cr="source ~/.zshrc"                   # Reload zsh configuration
alias cv="nano ~/.zshrc"                     # View or edit zsh configuration
alias cs="cd ~/.config/wsl"                  # Move to WSL configuration directory
alias cf="fzf"                               # Show current directory files

# Git
alias g="git"                                # Short for git
alias gb="git checkout -b"                   # Create and switch to a new branch
alias gw="git switch"                        # Switch branches
alias gt="git status"                        # Check the status of your working directory
alias gp="git push -u"                       # Push changes to a remote repository (upstream)

# GitHub CLI
alias gs="gh pr status"                      # Show status of relevant pull requests
alias gc="gh pr create"                      # Create a pull request on GitHub
alias gm="gh pr merge"                       # Merge a pull request on GitHub

# pnpm
alias pm="pnpm"                              # Standalone package manager for JavaScript
alias px="pnpm dlx"                          # Fetches a package from the registry without installing it as a dependency
alias ps="pnpm add"                          # Installs a package and any packages that it depends on
alias pr="pnpm remove"                       # Removes packages from node_modules and from the project's package.json
alias pu="pnpm update"                       # Updates packages to their latest version based on the specified range
alias po="pnpm outdated"                     # Checks for outdated packages, flags: --prod, --dev
alias pv="pnpm env"                          # Manages the Node.js environment

# Helper
alias q="bat ~/.config/wsl/docs/query.md"    # Show quick command
alias qc="bat ~/.config/wsl/docs/command.md" # Show quick command for Linux
alias qa="bat ~/.config/wsl/docs/arch.md"    # Show quick command for Pacman
alias qd="bat ~/.config/wsl/docs/debian.md"  # Show quick command for Apt
``