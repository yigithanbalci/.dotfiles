# Set environment variables in Fish
set -x CC clang
set -x CXX clang++
set -x STARSHIP_CONFIG ~/.config/starship/starship.toml
#set -x MANPAGER "sh -c 'col -bx | bat -l man -p'"
set -x MANPAGER "nvim +Man! -"
set -x SHELL (which fish)
set -x EDITOR vim

# Detect the operating system
set OS_NAME (uname -s)

# Check if the OS is macOS
if test "$OS_NAME" = Darwin
    # Set vars from Homebrew 
    fish_add_path /opt/homebrew/opt/llvm/bin
    # set -x LDFLAGS -L/opt/homebrew/opt/llvm/lib/unwind -lunwind 
    # set -x LDFLAGS -L/opt/homebrew/opt/llvm/lib
    set -x LDFLAGS -L/opt/homebrew/opt/llvm/lib -L/opt/homebrew/opt/llvm/lib/c++ -L/opt/homebrew/opt/llvm/lib/unwind -lunwind
    set -x CPPFLAGS -I/opt/homebrew/opt/llvm/include
    set -x SHELL /opt/homebrew/bin/fish
end

# Java — detect JAVA_HOME per platform
if test "$OS_NAME" = Darwin
    set -x JAVA_HOME (/usr/libexec/java_home 2>/dev/null)
else if test -d /usr/lib/jvm/default
    # Arch
    set -x JAVA_HOME /usr/lib/jvm/default
else if test -d /usr/lib/jvm/default-java
    # Ubuntu/Debian
    set -x JAVA_HOME /usr/lib/jvm/default-java
end

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
