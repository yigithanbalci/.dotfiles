# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## What This Is

A GNU Stow-based dotfiles repo targeting **macOS** (primary) and **Linux** (Arch, Ubuntu). Each top-level directory is a stow package.

## Symlink / Install Commands

```sh
./stow          # Re-stow all packages (runs `stow -R` per package, then `./link`)
./install       # Unstow + restow using $STOW_FOLDERS, then runs ./link
./link          # Creates cross-directory symlinks stow can't handle (e.g. terminal-shell → ~/.local/bin/)
./ubuntu        # Bootstrap subset of packages on Ubuntu ($STOW_FOLDERS defaults to bin,kitty,lazygit,nvim,tmux,zsh)
```

## Stow Routing

`.stowrc` sets default target to `~/.config` and ignores certain directories. Packages that need a different target are handled explicitly in `./stow` with `--target=`:
- `bash`, `zsh`, `idea`, `git`, `aerospace` → `$HOME`
- `local` → `$HOME/.local`
- Everything else (fish, starship, nvim, tmux, ghostty, etc.) → `~/.config` (via `.stowrc` default)

## Key Architecture

**Zsh config** is split across two packages:
- `zsh/` — `.zshrc` and `.zsh_profile` (stowed to `$HOME`)
- `zsh-conf/` — the actual config, stowed to `~/.config/zsh-conf/`. Numbered files in `conf.d/` are loaded in order: `00-utils` → `01-env` → `02-path` → `03-tools` → `04-keybindings` → `05-aliases` → ... `09-global_aliases`. Custom functions live in `functions/`.

**Fish config** mirrors the zsh setup: `config.fish` sources `settings.fish` and `env.vars.fish`, with `conf.d/` and `functions/` subdirectories.

**Platform detection** is used extensively in env/path files (`01-env.zsh`, `02-path.zsh`, `env.vars.fish`). Configs branch on `uname` output (Darwin vs Linux) and Linux distro (Arch vs Ubuntu). Secrets are sourced from `~/.shell_secrets` (not tracked).

**Submodules**: `nvim` and `doom` are separate repos pulled in as git submodules. Edit those configs in their own repositories.

## Things to Watch Out For

- `.stowrc` has an ignore list — new top-level directories that should stow to `~/.config` work automatically, but directories needing `$HOME` as target must be added to both `.stowrc` ignore list and `./stow` script.
- Environment variables like `JAVA_HOME`, `CC`, `CXX` have guards to avoid setting empty values when tools aren't installed. Preserve these guards.
- The numbered `conf.d/` ordering matters — utils and env must load before path and tools.
