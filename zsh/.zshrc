# Drop any stale FPATH entries a long-lived tmux/terminal session may have
# inherited (e.g. a now-deleted dir left over from a `brew upgrade zsh`),
# and make sure the currently running zsh's own function dir is present.
# Must run before oh-my-zsh.sh below, otherwise its compinit call can't
# find compdef/add-zsh-hook/is-at-least and silently fails to set up
# completions. Full PATH/FPATH setup happens later in zsh-conf/02-path.zsh.
typeset -U fpath
_early_clean_fpath=()
for _early_fp in $fpath; do
  [[ -d "$_early_fp" ]] && _early_clean_fpath+=("$_early_fp")
done
fpath=($_early_clean_fpath)
if [[ "$(uname -s)" == "Darwin" ]]; then
  _early_zsh_fns="/opt/homebrew/Cellar/zsh/${ZSH_VERSION}/share/zsh/functions"
  [[ -d "$_early_zsh_fns" ]] && fpath=("$_early_zsh_fns" $fpath)
  unset _early_zsh_fns
fi
unset _early_fp _early_clean_fpath
typeset +x FPATH

# Oh-My-Zsh
export ZSH="$HOME/.oh-my-zsh"
export COLORTERM=truecolor

plugins=(
  #git — OMZ git aliases; custom aliases in 05-aliases.zsh
  zsh-autosuggestions
  zsh-syntax-highlighting
  #this breaks ^f bindkey
  #zsh-vi-mode
  #fzf — already initialized in 03-tools.zsh
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
