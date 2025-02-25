function addToPath
    # Check if a directory argument is provided
    if test -z "$argv[1]"
        return 1
    end

    # Check if the directory exists
    if not test -d "$argv[1]"
        return 1
    end

    # Add directory to PATH if not already present
    if not contains -- "$argv[1]" $PATH
        set -x PATH $PATH $argv[1]
    end
end

function osSpecificTasks
    # Detect the operating system
    set OS_NAME (uname -s)

    # Check if the OS is macOS
    if test "$OS_NAME" = Darwin
        # Add Homebrew to PATH
        addToPath /opt/homebrew/bin

        # Evaluate Homebrew environment setup
        /opt/homebrew/bin/brew shellenv | source
    end
end

# Run the function
osSpecificTasks

if status is-interactive
    # Commands to run in interactive sessions can go here
end


# Set environment variables in Fish
set -x CC clang
set -x CXX clang++
set -x LDFLAGS -L/opt/homebrew/opt/llvm/lib
set -x CPPFLAGS -I/opt/homebrew/opt/llvm/include
set -x JAVA_HOME /opt/homebrew/Cellar/openjdk/23
set -x STARSHIP_CONFIG $HOME/.config/starship/starship.toml

# Add directories to PATH
addToPath /usr/local/bin
addToPath /usr/local/go/bin
addToPath $HOME/.local/bin
addToPath $HOME/.local/scripts
addToPath $HOME/.cargo/bin
addToPath $HOME/go/bin
addToPath $HOME/.config/emacs/bin
addToPath /opt/homebrew/opt/llvm/bin
addToPath /opt/homebrew/Cellar/openjdk/23/bin

# Source Rust environment variables if needed
# source $HOME/.cargo/env

function fish_user_key_bindings
    # Enable Vi mode (equivalent to bindkey -v)
    fish_vi_key_bindings

    # Bind Ctrl+F to run tmux-sessionizer (equivalent to bindkey -s '^f' "tmux-sessionizer\n")
    bind \cf tmux-sessionizer
    bind -M insert \cf tmux-sessionizer

    bind -M insert \cr history-pager repaint-mode

end

starship init fish | source
