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

# Git (cached — auto-invalidates when ~/.gitconfig changes)
local _git_user_cache="${XDG_CACHE_HOME:-$HOME/.cache}/zsh/git_user"
if [[ ! -f "$_git_user_cache" ]] || [[ "$HOME/.gitconfig" -nt "$_git_user_cache" ]]; then
  command mkdir -p "${_git_user_cache:h}"
  git config user.name > "$_git_user_cache"
fi
#TODO: GIT_USER is used in nvim code gen 
# make it a way that it should reflect changes in git user 
# by repo and usage of login etc 
# or change the logic in nvim code snippets 
export GIT_USER="$(< "$_git_user_cache")"
