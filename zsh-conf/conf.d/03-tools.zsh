# Tool initializations

# FZF
source <(fzf --zsh)

# Zoxide
eval "$(zoxide init zsh)"

# Starship prompt
eval "$(starship init zsh)"

# NVM (lazy-loaded — saves ~534ms per shell)
export NVM_DIR="$HOME/.nvm"

__load_nvm() {
  unfunction nvm node npm npx 2>/dev/null
  if [[ "$(uname -s)" == "Darwin" ]]; then
    [ -s "/opt/homebrew/opt/nvm/nvm.sh" ] && \. "/opt/homebrew/opt/nvm/nvm.sh"
    [ -s "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm" ] && \. "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm"
  else
    [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
    [ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"
  fi
}

for __nvm_cmd in nvm node npm npx; do
  eval "${__nvm_cmd}() { __load_nvm; ${__nvm_cmd} \"\$@\" }"
done
unset __nvm_cmd

# Opam (OCaml)
[[ ! -r "$HOME/.opam/opam-init/init.zsh" ]] || source "$HOME/.opam/opam-init/init.zsh" > /dev/null 2> /dev/null

# Dart CLI completion
[[ -f "$HOME/.dart-cli-completion/zsh-config.zsh" ]] && . "$HOME/.dart-cli-completion/zsh-config.zsh" || true

# Carapace
export CARAPACE_BRIDGES='zsh,fish,bash,inshellisense'
zstyle ':completion:*' format $'\e[2;37mCompleting %d\e[m'
source <(carapace _carapace)
