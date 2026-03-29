# Set environment variables in Fish
command -q clang; and set -x CC clang
command -q clang++; and set -x CXX clang++
set -x STARSHIP_CONFIG ~/.config/starship/starship.toml
#set -x MANPAGER "sh -c 'col -bx | bat -l man -p'"
set -x MANPAGER "nvim +Man! -"
set -x SHELL (which fish)
set -x EDITOR vim

# Detect the operating system
set OS_NAME (uname -s)

# Platform-specific compiler/linker flags (only set if non-empty)
set -l _ldflags ""
set -l _cppflags ""
if test "$OS_NAME" = Darwin
    # macOS — Homebrew LLVM
    fish_add_path /opt/homebrew/opt/llvm/bin
    set _ldflags "-L/opt/homebrew/opt/llvm/lib -L/opt/homebrew/opt/llvm/lib/c++ -L/opt/homebrew/opt/llvm/lib/unwind -lunwind"
    set _cppflags "-I/opt/homebrew/opt/llvm/include"
    set -x SHELL /opt/homebrew/bin/fish
else if test -d /usr/lib/llvm
    # Arch — use the latest versioned llvm directory
    set -l _llvm_dir (ls -d /usr/lib/llvm/*/lib 2>/dev/null | sort -V | tail -1)
    set -l _llvm_inc (ls -d /usr/lib/llvm/*/include 2>/dev/null | sort -V | tail -1)
    test -n "$_llvm_dir"; and set _ldflags "-L$_llvm_dir"
    test -n "$_llvm_inc"; and set _cppflags "-I$_llvm_inc"
else
    # Ubuntu/Debian — use the latest versioned llvm directory
    set -l _llvm_dir (ls -d /usr/lib/llvm-*/lib 2>/dev/null | sort -V | tail -1)
    set -l _llvm_inc (ls -d /usr/lib/llvm-*/include 2>/dev/null | sort -V | tail -1)
    test -n "$_llvm_dir"; and set _ldflags "-L$_llvm_dir"
    test -n "$_llvm_inc"; and set _cppflags "-I$_llvm_inc"
end
test -n "$_ldflags"; and set -x LDFLAGS $_ldflags
test -n "$_cppflags"; and set -x CPPFLAGS $_cppflags

# Java — detect JAVA_HOME per platform (only set if non-empty)
set -l _java_home ""
if test "$OS_NAME" = Darwin
    set _java_home (/usr/libexec/java_home 2>/dev/null)
else if test -d /usr/lib/jvm/default
    # Arch
    set _java_home /usr/lib/jvm/default
else if test -d /usr/lib/jvm/default-java
    # Ubuntu/Debian
    set _java_home /usr/lib/jvm/default-java
end
test -n "$_java_home"; and set -x JAVA_HOME $_java_home

# Secret tokens that are not in the repo
# Define the path to the .shell_secrets file
set SECRETS_FILE "$HOME/.shell_secrets"

# Check if the file exists
if test -f "$SECRETS_FILE"
    # Source the file if it exists
    source $SECRETS_FILE
    #echo ".shell_secrets file sourced successfully."
else
    #echo ".shell_secrets file does not exist."
end

# Ruby
if test -d /opt/homebrew/opt/ruby/bin
    set -x PATH /opt/homebrew/opt/ruby/bin $PATH
    set -x PATH (gem environment gemdir)/bin $PATH
end

# Carapace
set -Ux CARAPACE_BRIDGES 'zsh,fish,bash,inshellisense' # optional
