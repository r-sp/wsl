# set default language
export LANG=en_US.UTF-8

# init zsh plugins
source ~/.config/wsl/packages/completion.zsh
source ~/.config/wsl/packages/history.zsh
source ~/.config/wsl/packages/aliases.zsh
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
source <(fzf --zsh)
eval "$(zoxide init --cmd cd zsh)"
eval "$(starship init zsh)"

# init standalone pnpm
export PNPM_HOME="/home/<username>/.local/share/pnpm"
case ":$PATH:" in
  *":$PNPM_HOME:"*) ;;
  *) export PATH="$PNPM_HOME:$PATH" ;;
esac