#!/usr/bin/env bash
# ${HOME}/.bashrc: executed by bash(1) for non-login shells.
# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# Remap caps to escape
setxkbmap -option caps:escape

# Aliases
alias pcss="pacman -Ss"
alias pcls="pacman -Qs"
alias ls="ls --color=auto"
alias config='/usr/bin/git --git-dir=/home/pabi/.cfg/ --work-tree=/home/pabi'
# Use vim as your pager instead of less or more
alias vless='vim -u /usr/share/vim/vim80/macros/less.vim'
# Add vi-style bindings to bash
# (insert mode default, escape for normal mode, no visual mode)
set -o vi

# Colorize bash prompt
GREEN="\[$(tput setaf 11)\]"
RESET="\[$(tput sgr0)\]"
PROMPT=$PS1

export PS1="${GREEN}${PROMPT}${RESET}"

# Add magicmonty/bash-git-prompt for... git prompts
GIT_PROMPT_ONLY_IN_REPO=1
# Remove leading checkmark; the exit state of the last command
GIT_PROMPT_THEME=Default_NoExitState_Ubuntu
source ~/.bash-git-prompt/gitprompt.sh

# Add rbenv to path
export PATH="$HOME/.rbenv/bin:$PATH"

# Load rbenv automatically by appending
eval "$(rbenv init -)"
