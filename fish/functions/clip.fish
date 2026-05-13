function clip
    if type -q pbcopy
        # macOS
        pbcopy
    else if set -q WAYLAND_DISPLAY; and type -q wl-copy
        # Linux Wayland
        wl-copy
    else if type -q xclip
        # Linux X11 (xclip)
        xclip -selection clipboard
    else if type -q xsel
        # Linux X11 (xsel)
        xsel --clipboard --input
    else if type -q wl-copy
        # Linux Wayland (fallback when WAYLAND_DISPLAY unset)
        wl-copy
    else
        echo "No clipboard utility found. Install xclip, xsel, or wl-clipboard." >&2
        return 1
    end
end