#!/usr/bin/env bash
# Symlink dotfiles into place. Existing files are backed up to <path>.bak
set -euo pipefail

DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

link() {
    local src="$1" dst="$2"
    [ -e "$dst" ] && [ ! -L "$dst" ] && mv "$dst" "$dst.bak"
    ln -sfn "$src" "$dst"
    echo "linked $dst"
}

mkdir -p "$HOME/.config"

# ~/.config/<name>
for d in hypr waybar wofi kitty; do
    link "$DIR/$d" "$HOME/.config/$d"
done

# ~/.<name>
link "$DIR/.zshrc" "$HOME/.zshrc"

echo "done."
