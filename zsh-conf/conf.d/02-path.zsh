# PATH setup

# OS-specific paths
if [[ "$(uname -s)" == "Darwin" ]]; then
  addToPath /opt/homebrew/bin
  addToPath /opt/homebrew/opt/llvm/bin
  eval "$(/opt/homebrew/bin/brew shellenv)"

  # OpenJDK
  export PATH="/opt/homebrew/opt/openjdk/bin:$PATH"
  export CPPFLAGS="-I/opt/homebrew/opt/openjdk/include"

  # Ruby
  if [ -d "/opt/homebrew/opt/ruby/bin" ]; then
    export PATH=/opt/homebrew/opt/ruby/bin:$PATH
    export PATH=$(gem environment gemdir)/bin:$PATH
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
