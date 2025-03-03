function fish_user_key_bindings
    # Execute this once per mode that emacs bindings should be used in
    fish_default_key_bindings -M insert
    # Enable Vi mode (equivalent to bindkey -v)
    fish_vi_key_bindings --no-erase insert

    # Bind Ctrl+F to run tmux-sessionizer (equivalent to bindkey -s '^f' "tmux-sessionizer\n")
    bind \cf tmux-sessionizer
    bind -M insert \cf tmux-sessionizer 'commandline -f repaint'

    #bind -M insert \cr history-pager repaint-mode
    #bind \cc __fish_cancel_commandline
    #bind -M insert \cc __fish_cancel_commandline
    #bind -M normal \cc __fish_cancel_commandline
    #bind -M visual \cc __fish_cancel_commandline
end
