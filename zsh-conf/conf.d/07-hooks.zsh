# Play a sound on any non-zero exit code (precmd hook)

__error_sound_file="$HOME/devenv/sounds/faaaah.wav"

# Resolve audio player once at shell init
__error_sound_player=()
if [[ -f "$__error_sound_file" ]]; then
  if [[ "$(uname -s)" == "Darwin" ]]; then
    command -v afplay &>/dev/null && __error_sound_player=(afplay)
  else
    # paplay: PulseAudio/PipeWire (Ubuntu, Arch)
    # aplay: ALSA fallback
    if command -v paplay &>/dev/null; then
      __error_sound_player=(paplay)
    elif command -v aplay &>/dev/null; then
      __error_sound_player=(aplay -q)
    fi
  fi
fi

if (( ${#__error_sound_player} )); then
  __error_sound_precmd() {
    # Play only for real errors (1-128), not signals like Ctrl-C (130 = 128+SIGINT)
    (( __error_sound_last_status > 0 && __error_sound_last_status <= 128 )) && \
      ( "${__error_sound_player[@]}" "$__error_sound_file" &>/dev/null & )
  }

  # Capture $? before any other precmd hook resets it
  __error_sound_save_status() {
    __error_sound_last_status=$?
  }

  # Guard against double-sourcing
  if (( ! ${precmd_functions[(Ie)__error_sound_save_status]} )); then
    # save_status must run first (prepend), sound plays last (append)
    precmd_functions=(__error_sound_save_status "${precmd_functions[@]}")
    precmd_functions+=(__error_sound_precmd)
  fi
fi

# Auto-use correct Node version with nvm
# nvm.sh is sourced with --no-use (see 03-tools.zsh) so we control
# when `nvm use` runs — once on first prompt and on every cd.
__nvm_auto_use() {
  if [[ -f .nvmrc ]]; then
    # Lazy-load nvm if it hasn't been loaded yet
    if (( $+functions[__load_nvm] )); then
      __load_nvm
    fi
    nvm use
  fi
}

# Run once on first prompt (covers tmux new-session -c, tmux-project, etc.)
# Guard: some plugins duplicate precmd_functions entries, so we use a flag
# to ensure this only fires once even if listed multiple times.
__nvm_first_precmd() {
  if (( __nvm_first_precmd_done )); then return; fi
  __nvm_first_precmd_done=1
  __nvm_auto_use
  precmd_functions=(${precmd_functions:#__nvm_first_precmd})
}
precmd_functions+=(__nvm_first_precmd)

# chpwd Hook - Run Commands on Directory Change
# NOTE: Only one chpwd hook can be defined at once
chpwd() {
  __nvm_auto_use
}
