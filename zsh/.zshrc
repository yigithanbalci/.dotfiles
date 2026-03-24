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

# SDKMAN (lazy-loaded — saves ~217ms per shell)
export SDKMAN_DIR="$HOME/.sdkman"

__load_sdkman() {
  unfunction sdk java javac gradle mvn kotlin kotlinc groovy groovyc 2>/dev/null
  [[ -s "$HOME/.sdkman/bin/sdkman-init.sh" ]] && source "$HOME/.sdkman/bin/sdkman-init.sh"
}

for __sdk_cmd in sdk java javac gradle mvn kotlin kotlinc groovy groovyc; do
  eval "${__sdk_cmd}() { __load_sdkman; ${__sdk_cmd} \"\$@\" }"
done
unset __sdk_cmd
