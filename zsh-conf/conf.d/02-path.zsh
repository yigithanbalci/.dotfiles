# PATH setup

# OS-specific paths
if [[ "$(uname -s)" == "Darwin" ]]; then
  addToPath /opt/homebrew/bin
  addToPath /opt/homebrew/opt/llvm/bin
  eval "$(/opt/homebrew/bin/brew shellenv)"

  # OpenJDK
  export PATH="/opt/homebrew/opt/openjdk/bin:$PATH"
  export CPPFLAGS="-I/opt/homebrew/opt/openjdk/include"

  # Ruby (gem path cached — invalidate with: rm ~/.cache/zsh/gem_dir)
  if [ -d "/opt/homebrew/opt/ruby/bin" ]; then
    export PATH=/opt/homebrew/opt/ruby/bin:$PATH
    local _gem_cache="${XDG_CACHE_HOME:-$HOME/.cache}/zsh/gem_dir"
    if [[ ! -f "$_gem_cache" ]]; then
      command mkdir -p "${_gem_cache:h}"
      gem environment gemdir > "$_gem_cache"
    fi
    export PATH="$(< "$_gem_cache")/bin:$PATH"
  fi
fi

# Cross-platform paths
addToPath /usr/local/bin
addToPath /usr/local/go/bin
addToPath $HOME/.local/bin
addToPath $HOME/.local/scripts/
addToPath $HOME/.cargo/bin
addToPath $HOME/go/bin
addToPath $HOME/.config/emacs/bin
addToPath $JAVA_HOME/bin
addToPath $HOME/programs/flutter/bin/
