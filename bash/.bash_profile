# ~/.bash_profile

# Only run on macOS
if [[ "$(uname)" == "Darwin" ]]; then
  # Apple Silicon (M1/M2/M3 Macs)
  if [[ -d "/opt/homebrew" ]]; then
    eval "$(/opt/homebrew/bin/brew shellenv)"
  # Intel Macs
  elif [[ -d "/usr/local/Homebrew" ]]; then
    eval "$(/usr/local/bin/brew shellenv)"
  fi
fi
