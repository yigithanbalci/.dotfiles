git() {
  command git "$@"
  local ret=$?
  if [[ "$1" == "clone" && $ret -eq 0 ]]; then
    __zoxide_seed_refresh &!
  fi
  return $ret
}
