function fish_user_key_bindings
    # Execute this once per mode that emacs bindings should be used in
    fish_default_key_bindings -M insert
    # Enable Vi mode (equivalent to bindkey -v)
    fish_vi_key_bindings --no-erase insert

    # --- Custom binds ---

    # Bind Ctrl+F to run tmux-sessionizer (equivalent to bindkey -s '^f' "tmux-sessionizer\n")
    bind \cf tmux-sessionizer
    bind -M insert \cf tmux-sessionizer 'commandline -f repaint'

    # Ctrl-n: next (pager-aware / history / cursor forward)
    bind \cn forward-char

    # Ctrl-p: previous (pager-aware / history / cursor backward)
    bind \cp backward-char

    # Ctrl-d: page down in pager (fallback: down one line, or delete-char-or-exit if no pager)
    function __pager_page_down --description 'page down in pager or delete-char-or-exit'
        if status --is-interactive
            commandline -f page-down 2>/dev/null || commandline -f down-line 2>/dev/null
        end
    end
    bind \cd __pager_page_down


end
