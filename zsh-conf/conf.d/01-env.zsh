# Environment variable exports

# Compiler settings
export CC=clang
export CXX=clang++

if [[ "$(uname -s)" == "Darwin" ]]; then
  export LDFLAGS="-L/opt/homebrew/opt/llvm/lib -L/opt/homebrew/opt/llvm/lib/c++ -L/opt/homebrew/opt/llvm/lib/unwind -lunwind"
  export CPPFLAGS="-I/opt/homebrew/opt/llvm/include"
  export JAVA_HOME=/opt/homebrew/Cellar/openjdk/23
fi

# Program settings
export STARSHIP_CONFIG=$HOME/.config/starship/starship.toml
