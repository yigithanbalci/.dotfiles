yarn() {
  command yarn "$@"
  local yarn_exit_code=$?

  if [[ $yarn_exit_code -ne 0 ]]; then
    if [[ "$(uname -s)" == "Darwin" ]]; then
      # Running it inside ( ) & "disowns" the job so you don't see the [PID] or 'done' message
      (afplay ~/devenv/sounds/faaaah.wav &>/dev/null &)
    fi
  fi

  return $yarn_exit_code
}
