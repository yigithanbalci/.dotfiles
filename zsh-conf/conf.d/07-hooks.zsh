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

# chpwd Hook - Run Commands on Directory Change
# NOTE: Only one chpwd hook can be defined at once
chpwd() {
  # Auto-use correct Node version with nvm
  if [[ -f .nvmrc ]]; then
    nvm use
  fi
}
