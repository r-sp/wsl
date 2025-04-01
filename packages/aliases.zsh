# Config
alias c="clear"
alias cr="source ~/.zshrc"
alias cv="nano ~/.zshrc"
alias cs="cd ~/.config/wsl"
alias cf="fzf"

# Git
alias g="git"
alias gb="git checkout -b"
alias gw="git switch"
alias gt="git status"
alias gp="git push -u"

# GitHub CLI
alias gs="gh pr status"
alias gc="gh pr create"
alias gm="gh pr merge"

# pnpm
alias pm="pnpm"
alias px="pnpm dlx"
alias ps="pnpm add"
alias pr="pnpm remove"
alias pu="pnpm update"
alias po="pnpm outdated"
alias pv="pnpm env"

# Helper
alias q="bat ~/.config/wsl/docs/shortcut.md"
alias qc="bat ~/.config/wsl/docs/linux.md"
alias qa="bat ~/.config/wsl/docs/pacman.md"
alias qd="bat ~/.config/wsl/docs/apt.md"
alias vc="bat --color=always"
alias -g -- -h='-h 2>&1 | bat --language=help --style=plain'
alias -g -- --help='--help 2>&1 | bat --language=help --style=plain'