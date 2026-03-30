# Environment variable exports

# Compiler settings
(( $+commands[clang] )) && export CC=clang
(( $+commands[clang++] )) && export CXX=clang++
export EDITOR="vim"

local _ldflags=""
local _cppflags=""
if [[ "$(uname -s)" == "Darwin" ]]; then
  _ldflags="-L/opt/homebrew/opt/llvm/lib -L/opt/homebrew/opt/llvm/lib/c++ -L/opt/homebrew/opt/llvm/lib/unwind -lunwind"
  _cppflags="-I/opt/homebrew/opt/llvm/include"
elif [[ -d /usr/lib/llvm ]]; then
  # Arch — use the latest versioned llvm directory
  local _llvm_dir=$(ls -d /usr/lib/llvm/*/lib 2>/dev/null | sort -V | tail -1)
  local _llvm_inc=$(ls -d /usr/lib/llvm/*/include 2>/dev/null | sort -V | tail -1)
  [[ -n "$_llvm_dir" ]] && _ldflags="-L$_llvm_dir"
  [[ -n "$_llvm_inc" ]] && _cppflags="-I$_llvm_inc"
elif [[ -d /usr/lib/llvm-* ]]; then
  # Ubuntu/Debian — use the latest versioned llvm directory
  local _llvm_dir=$(ls -d /usr/lib/llvm-*/lib 2>/dev/null | sort -V | tail -1)
  local _llvm_inc=$(ls -d /usr/lib/llvm-*/include 2>/dev/null | sort -V | tail -1)
  [[ -n "$_llvm_dir" ]] && _ldflags="-L$_llvm_dir"
  [[ -n "$_llvm_inc" ]] && _cppflags="-I$_llvm_inc"
fi
[[ -n "$_ldflags" ]] && export LDFLAGS="$_ldflags"
[[ -n "$_cppflags" ]] && export CPPFLAGS="$_cppflags"

# Java — detect JAVA_HOME per platform (only set if non-empty)
local _java_home=""
if [[ "$(uname -s)" == "Darwin" ]]; then
  _java_home=$(/usr/libexec/java_home 2>/dev/null)
elif [[ -d /usr/lib/jvm/default ]]; then
  # Arch
  _java_home=/usr/lib/jvm/default
elif [[ -d /usr/lib/jvm/default-java ]]; then
  # Ubuntu/Debian
  _java_home=/usr/lib/jvm/default-java
fi
[[ -n "$_java_home" ]] && export JAVA_HOME="$_java_home"

# Program settings
export STARSHIP_CONFIG=$HOME/.config/starship/starship.toml
export ZLE_RPROMPT_INDENT=0

# Named Directories — access with ~name syntax (e.g., cd ~dot, ls ~dl)
hash -d dot=~/devenv/dotfiles
hash -d dl=~/Downloads
