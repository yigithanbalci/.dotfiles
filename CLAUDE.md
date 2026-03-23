# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Deploying Dotfiles

The primary deployment script is `stow`, which symlinks configs to their expected locations:

```bash
./stow          # deploy all configs
```

This script runs `stow -R` for each tool, using custom `--target` flags for tools that live outside `~/.config`:

| Tool | Target |
|------|--------|
| Most configs (nvim, tmux, etc.) | `~/.config` (via `.stowrc`) |
| `bash`, `zsh`, `git`, `idea`, `aerospace` | `$HOME` |
| `local` | `$HOME/.local` |

After stowing, `./link` creates a symlink for `terminal-shell` from `~/.local/scripts/` to `~/.local/bin/`.

### `.stowrc` behavior

Running `stow .` from the repo root uses `.stowrc` which sets `--target=~/.config` and explicitly ignores tools that need custom targets (`zsh`, `git`, `bash`, `local`, `aerospace`, `idea`, etc.). Those must be stowed separately.

## Architecture

### Submodules

`nvim` and `doom` are separate git repos included as submodules:
- `nvim` → https://github.com/yigithanbalci/nvim.git (LazyVim-based)
- `doom` → https://github.com/yigithanbalci/doom.git

After cloning: `git submodule update --init --recursive`

### Directory conventions

Each top-level directory mirrors the application name and contains files in the structure expected after symlinking to its target. For example, `nvim/` symlinks to `~/.config/nvim/`, `zsh/.zshrc` symlinks to `~/.zshrc`.

### Platform-specific configs

- **macOS:** `aerospace/`, `yabai/`, `skhd/`
- **Linux:** `hypr/`, `i3/`, `sway/`, `waybar/`

### Local scripts

Custom shell scripts live in `local/scripts/` (stowed to `~/.local/scripts/`):
- `tmux-sessionizer` / `tmux-windowizer` — tmux workflow helpers
- `tmux-cht.sh` — cheat sheet lookup via tmux
- `terminal-shell` — shell switching utility (also symlinked to `~/.local/bin/`)
- `kitty-bg-picker` / `kitty-bg-conf-generator` — Kitty background tools

## Guidelines

### Platform-specific configurations

This repo targets multiple OSes (macOS and Linux). Always make configs platform-specific wherever applicable:
- Use OS conditionals in shell files (e.g., `if [[ "$OSTYPE" == "darwin"* ]]`)
- Use platform-specific config directories (`aerospace/`, `yabai/`, `skhd/` for macOS; `hypr/`, `i3/`, `sway/`, `waybar/` for Linux)
- Never add macOS-only or Linux-only settings globally without a platform guard

### Shell setup

- **Primary shell:** Zsh (`zsh/.zshrc`, `zsh/.zsh_profile`) — stowed to `$HOME`
- **Alternative:** Fish (`fish/config.fish`, `fish/env.vars.fish`)
- **Prompt:** Starship (`starship/starship.toml`)
