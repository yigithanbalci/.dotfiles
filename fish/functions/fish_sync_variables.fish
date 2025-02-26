function fish_sync_variables

    # Set environment variables in Fish
    set -x CC clang
    set -x CXX clang++
    set -x LDFLAGS -L/opt/homebrew/opt/llvm/lib
    set -x CPPFLAGS -I/opt/homebrew/opt/llvm/include
    set -x JAVA_HOME /opt/homebrew/Cellar/openjdk/23
    set -x STARSHIP_CONFIG $HOME/.config/starship/starship.toml

end
