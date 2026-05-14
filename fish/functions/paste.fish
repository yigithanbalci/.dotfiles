function paste
    if type -q pbpaste
        # macOS
        pbpaste
    else if set -q WAYLAND_DISPLAY; and type -q wl-paste
        # Linux Wayland
        wl-paste
    else if type -q xclip
        # Linux X11 (xclip)
        xclip -selection clipboard -o
    else if type -q xsel
        # Linux X11 (xsel)
        xsel --clipboard --output
    else if type -q wl-paste
        # Linux Wayland (fallback when WAYLAND_DISPLAY unset)
        wl-paste
    else
        echo "No clipboard utility found. Install xclip, xsel, or wl-clipboard." >&2
        return 1
    end
end