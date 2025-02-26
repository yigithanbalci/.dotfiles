function fish_user_key_bindings
    # Enable Vi mode (equivalent to bindkey -v)
    fish_vi_key_bindings

    # Force block cursor in all Vi modes
    function fish_mode_prompt
        echo -ne "\e[2 q"
    end

    # Bind Ctrl+F to run tmux-sessionizer (equivalent to bindkey -s '^f' "tmux-sessionizer\n")
    bind \cf tmux-sessionizer
    bind -M insert \cf tmux-sessionizer 'commandline -f repaint'

    #bind -M insert \cr history-pager repaint-mode
    bind \cc __fish_cancel_commandline
    bind -M insert \cc __fish_cancel_commandline
    bind -M normal \cc __fish_cancel_commandline
    bind -M visual \cc __fish_cancel_commandline
end
