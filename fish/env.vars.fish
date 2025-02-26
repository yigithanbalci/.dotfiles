# Set environment variables in Fish
set -x CC clang
set -x CXX clang++
set -x STARSHIP_CONFIG ~/.config/starship/starship.toml

# Detect the operating system
set OS_NAME (uname -s)

# Check if the OS is macOS
if test "$OS_NAME" = Darwin
    # Set vars from Homebrew 
    set -x LDFLAGS -L/opt/homebrew/opt/llvm/lib
    set -x CPPFLAGS -I/opt/homebrew/opt/llvm/include
    set -x JAVA_HOME /opt/homebrew/Cellar/openjdk/23
    set -x SHELL /opt/homebrew/bin/fish
end
