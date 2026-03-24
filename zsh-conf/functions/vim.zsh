vim() {
  if [[ "$1" == "--real" ]]; then
    shift
    command vim "$@"
  elif command -v nvim >/dev/null 2>&1; then
    command nvim "$@"
  else
    command vim "$@"
  fi
}
