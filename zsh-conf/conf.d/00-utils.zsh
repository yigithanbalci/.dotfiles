# Utility functions needed by subsequent config files

addToPath() {
  if [ -z "$1" ]; then
    return 1
  fi

  if [ ! -d "$1" ]; then
    return 1
  fi

  if [[ ":$PATH:" != *":$1:"* ]]; then
    export PATH="$PATH:$1"
  fi
}
