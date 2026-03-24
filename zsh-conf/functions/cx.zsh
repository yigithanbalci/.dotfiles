# cd: try z first, fallback to builtin cd, then not ls
cx() {
  if [ -z "$1" ]; then
    echo "Usage: cx <directory>"
    return 1
  fi

  if command -v z >/dev/null 2>&1; then
    z "$1"
    if [ $? -ne 0 ]; then
      builtin cd "$1"
    fi
  else
    builtin cd "$1"
  fi
}
