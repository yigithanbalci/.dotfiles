# Oh-My-Zsh
export ZSH="$HOME/.oh-my-zsh"
export COLORTERM=truecolor

plugins=(
  git
  zsh-autosuggestions
  zsh-syntax-highlighting
  #this breaks ^f bindkey
  #zsh-vi-mode
  fzf
)

source $ZSH/oh-my-zsh.sh

# Profile — env, path, tools, keybindings, aliases, functions
source ~/.zsh_profile

# Secrets
SECRETS_FILE="$HOME/.shell_secrets"
if [ -f "$SECRETS_FILE" ]; then
  source "$SECRETS_FILE"
else
  echo ".shell_secrets file does not exist."
fi

# THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK
export SDKMAN_DIR="$HOME/.sdkman"
[[ -s "$HOME/.sdkman/bin/sdkman-init.sh" ]] && source "$HOME/.sdkman/bin/sdkman-init.sh"
