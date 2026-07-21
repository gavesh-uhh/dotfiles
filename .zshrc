# Zsh Config

HISTFILE=~/.zsh_history
HISTSIZE=10000
SAVEHIST=10000

setopt APPEND_HISTORY
setopt SHARE_HISTORY
setopt HIST_IGNORE_DUPS
setopt HIST_IGNORE_SPACE
setopt AUTO_CD
setopt CORRECT

source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

eval "$(starship init zsh)"

eval "$(zoxide init zsh)"

alias cls="clear"
alias c="clear"

alias ..="cd .."
alias ...="cd ../.."
alias ....="cd ../../.."

alias ls="eza --icons"
alias ll="eza -lah --icons"
alias la="eza -a --icons"

alias cat="bat"

alias cp="cp -i"
alias mv="mv -i"
alias rm="rm -i"

alias update="sudo pacman -Syu"
alias install="sudo pacman -S"
alias remove="sudo pacman -Rns"
alias search="pacman -Ss"

alias gs="git status"
alias ga="git add"
alias gc="git commit"
alias gp="git push"
alias gl="git log --oneline"

alias reboot="systemctl reboot"
alias shutdown="systemctl poweroff"

alias hyprreload="hyprctl reload"
alias hyprmon="hyprctl monitors"

alias ip="ip -c"

export EDITOR=nano
export VISUAL=nano

export FZF_DEFAULT_OPTS="--height 40% --layout=reverse --border"

source /usr/share/nvm/init-nvm.sh


# Added by Antigravity CLI installer
export PATH="/home/gav/.local/bin:$PATH"
export PATH="/home/gav/.local/bin:$PATH"
