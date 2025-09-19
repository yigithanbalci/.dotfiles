function fish_user_key_bindings
    # Execute this once per mode that emacs bindings should be used in
    fish_default_key_bindings -M insert
    # Enable Vi mode (equivalent to bindkey -v)
    fish_vi_key_bindings --no-erase insert

    # --- Custom binds ---

    # Map Ctrl-P to select the previous menu item
    bind \cp menu-select -1

    # Map Ctrl-N to select the next menu item
    bind \cn menu-select +1
    # Bind Ctrl+F to run tmux-sessionizer (equivalent to bindkey -s '^f' "tmux-sessionizer\n")
    bind \cf tmux-sessionizer
    bind -M insert \cf tmux-sessionizer 'commandline -f repaint'
end
