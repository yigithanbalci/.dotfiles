# Environment variable exports

# Compiler settings
export CC=clang
export CXX=clang++
export EDITOR="vim"

if [[ "$(uname -s)" == "Darwin" ]]; then
  export LDFLAGS="-L/opt/homebrew/opt/llvm/lib -L/opt/homebrew/opt/llvm/lib/c++ -L/opt/homebrew/opt/llvm/lib/unwind -lunwind"
  export CPPFLAGS="-I/opt/homebrew/opt/llvm/include"
fi

# Java — detect JAVA_HOME per platform
if [[ "$(uname -s)" == "Darwin" ]]; then
  export JAVA_HOME=$(/usr/libexec/java_home 2>/dev/null)
elif [[ -d /usr/lib/jvm/default ]]; then
  # Arch
  export JAVA_HOME=/usr/lib/jvm/default
elif [[ -d /usr/lib/jvm/default-java ]]; then
  # Ubuntu/Debian
  export JAVA_HOME=/usr/lib/jvm/default-java
fi

# Program settings
export STARSHIP_CONFIG=$HOME/.config/starship/starship.toml
export ZLE_RPROMPT_INDENT=0

# Named Directories — access with ~name syntax (e.g., cd ~dot, ls ~dl)
hash -d dot=~/devenv/dotfiles
hash -d dl=~/Downloads
