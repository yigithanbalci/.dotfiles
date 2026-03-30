mkdir() {
  command mkdir "$@"
  local ret=$?
  if [[ $ret -eq 0 ]]; then
    __zoxide_seed_refresh 2>/dev/null || true
  fi
  return $ret
}