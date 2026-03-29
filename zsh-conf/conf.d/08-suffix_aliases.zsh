# Suffix Aliases - Open files by extension
# Just type the filename to open it with the associated program
#   e.g.  README.md  ->  bat README.md
#         main.go    ->  $EDITOR main.go

# --- Viewer: bat (paged, syntax-highlighted) ---
alias -s {md,txt,log}=bat
alias -s {yaml,yml,xml,csv,sql}=bat
alias -s {properties,gitignore,gitconfig,editorconfig}=bat

# --- Viewer: jless (interactive JSON) ---
alias -s json=jless

# --- Editor ($EDITOR / neovim) ---
# C / C++
alias -s {c,h,cpp,hpp,cc,hh}='$EDITOR'

# Go / Rust / Zig
alias -s {go,rs,zig}='$EDITOR'

# Java / Kotlin / Gradle
alias -s {java,kt,kts,gradle}='$EDITOR'

# JavaScript / TypeScript (NestJS, React)
alias -s {js,jsx,mjs,cjs,ts,tsx}='$EDITOR'

# Python / Ruby / Dart / OCaml
alias -s {py,rb,dart,ml,mli}='$EDITOR'

# Lua
alias -s lua='$EDITOR'

# Shell
alias -s {sh,bash,zsh,fish}='$EDITOR'

# Config / Build
alias -s {toml,cmake}='$EDITOR'

# Web
alias -s {css,scss,html}='$EDITOR'

# --- Open with default app (macOS: open, Linux: xdg-open) ---
if [[ "$OSTYPE" == darwin* ]]; then
  alias -s {pdf,svg}=open
else
  if command -v xdg-open >/dev/null 2>&1; then
    alias -s {pdf,svg}=xdg-open
  elif command -v open >/dev/null 2>&1; then
    alias -s {pdf,svg}=open
  fi
fi