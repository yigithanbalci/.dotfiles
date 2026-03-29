function fish_user_key_bindings
    # Execute this once per mode that emacs bindings should be used in
    fish_default_key_bindings -M insert
    # Enable Vi mode (equivalent to bindkey -v)
    fish_vi_key_bindings --no-erase insert

    # --- Custom binds ---

    # Map Ctrl-P to select the previous menu item
    bind \cp up-or-search

    # Map Ctrl-N to select the next menu item
    bind \cn down-or-search
    # Bind Ctrl+F to tv projects with fallback to tmux-sessionizer
    function __tv_projects_or_sessionizer
        if command -v tv >/dev/null 2>&1
            tv tmux-sessionizer
        else
            tmux-sessionizer
        end
        commandline -f repaint
    end
    bind \cf __tv_projects_or_sessionizer
    bind -M insert \cf __tv_projects_or_sessionizer

    # Bind Ctrl+R to tv fish-history with fallback to fzf history search
    function __tv_history_or_fzf
        if command -v tv >/dev/null 2>&1
            set -l current_prompt (commandline -cp)
            printf "\n"
            set selected (tv fish-history --input "$current_prompt" --inline --no-status-bar)
            if test -n "$selected"
                commandline -r -- $selected
            end
            printf "\033[A"
        else
            _fzf_search_history
        end
        commandline -f repaint
    end
    bind \cr __tv_history_or_fzf
    bind -M insert \cr __tv_history_or_fzf

    # Open the current command in $EDITOR with Ctrl+X Ctrl+E
    bind \cx\ce edit_command_buffer
    bind -M insert \cx\ce edit_command_buffer
end
