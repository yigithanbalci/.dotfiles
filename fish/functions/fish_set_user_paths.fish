function fish_set_user_paths
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
end
