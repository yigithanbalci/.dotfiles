git() {
  command git "$@"
  local ret=$?
  if [[ "$1" == "clone" ]]; then
    __zoxide_seed_refresh
  fi
  return $ret
}