# Tool initializations (cached — auto-invalidates when binaries update)

# FZF
_cached_eval fzf 'fzf --zsh'

# Zoxide
_cached_eval zoxide 'zoxide init zsh'

# Starship prompt
_cached_eval starship 'starship init zsh'

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

# Opam (OCaml — lazy-loaded)
__load_opam() {
  unfunction opam ocaml ocamlfind dune 2>/dev/null
  [[ -r "$HOME/.opam/opam-init/init.zsh" ]] && source "$HOME/.opam/opam-init/init.zsh" > /dev/null 2> /dev/null
}
for __opam_cmd in opam ocaml ocamlfind dune; do
  eval "${__opam_cmd}() { __load_opam; ${__opam_cmd} \"\$@\" }"
done
unset __opam_cmd

# Dart CLI completion (lazy-loaded)
__load_dart_completion() {
  unfunction dart flutter 2>/dev/null
  [[ -f "$HOME/.dart-cli-completion/zsh-config.zsh" ]] && . "$HOME/.dart-cli-completion/zsh-config.zsh"
}
for __dart_cmd in dart flutter; do
  eval "${__dart_cmd}() { __load_dart_completion; ${__dart_cmd} \"\$@\" }"
done
unset __dart_cmd

# Carapace
export CARAPACE_BRIDGES='zsh,fish,bash,inshellisense'
zstyle ':completion:*' format $'\e[2;37mCompleting %d\e[m'
_cached_eval carapace 'carapace _carapace'
