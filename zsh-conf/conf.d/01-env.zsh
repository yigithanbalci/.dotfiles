# Environment variable exports

# Compiler settings
export CC=clang
export CXX=clang++
export EDITOR="vim"

if [[ "$(uname -s)" == "Darwin" ]]; then
  export LDFLAGS="-L/opt/homebrew/opt/llvm/lib -L/opt/homebrew/opt/llvm/lib/c++ -L/opt/homebrew/opt/llvm/lib/unwind -lunwind"
  export CPPFLAGS="-I/opt/homebrew/opt/llvm/include"
  export JAVA_HOME=/opt/homebrew/Cellar/openjdk/23
fi

# Program settings
export STARSHIP_CONFIG=$HOME/.config/starship/starship.toml
export ZLE_RPROMPT_INDENT=0

# Named Directories - Bookmark Folders
# Access with ~name syntax, e.g., cd ~yt or ls ~yt
# hash -d yt=~/projects/youtube
hash -d dot=~/devenv/.dotfiles
hash -d dl=~/Downloads
