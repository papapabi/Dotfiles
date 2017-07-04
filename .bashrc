#!/usr/bin/env bash
# ${HOME}/.bashrc: executed by bash(1) for non-login shells.
# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# Remap caps to escape
setxkbmap -option caps:escape

# Case-insensitive globbing (used in pathname expansion)
shopt -s nocaseglob;

# Autocorrect typos in path names when using `cd`
shopt -s cdspell;

# Enable some Bash 4 features when possible:
# * `autocd`, e.g. `**/qux` will enter `./foo/bar/baz/qux`
# * Recursive globbing, e.g. `echo **/*.txt`
for option in autocd globstar; do
	shopt -s "$option" 2> /dev/null;
done;

# Use bash-completion, if available
[[ $PS1 && -f /usr/share/bash-completion/bash_completion ]] && \
    . /usr/share/bash-completion/bash_completion

# Case-insensitive tab completion, love this
bind "set completion-ignore-case on"
bind "set show-all-if-ambiguous on"

# Aliases
# NOTE: for native outputs, use /usr/bin/*
alias ls='ls --classify --human-readable --color=auto' # Default ls
alias lx='ls -lXB'                                     # Sort by extension.
alias ll='ls -lv --group-directories-first' # Long-list, natural number sort
alias lm='ll | more'
alias la='ll -A'                                       # All except . and ..
alias tree='tree -Csuh'                                # A better recursive ls
# Prompt before doing dangerous ops
alias rm='rm -i'
alias cp='cp -i'
alias mv='mv -i'
# Prevent accidental file clobbering
alias mkdir='mkdir -p'
alias h='history'
alias grep='grep --color'
alias mygrep='grep -nIi --color' # Case-insensitive grep
alias recgrep='grep -rnIi --color'
alias cls='printf "\033c"'
alias pcss='pacman -Ss'
alias pcls='pacman -Qs'
alias config='/usr/bin/git --git-dir=/home/pabi/.cfg/ --work-tree=/home/pabi'
# Use vim as a pager 
alias vless='vim -u /usr/share/vim/vim80/macros/less.vim'
# Add vi-style bindings to bash
# (insert mode default, escape for normal mode, no visual mode)
set -o vi

# Colorize bash prompt
YELLOW="\[$(tput setaf 11)\]"
RESET="\[$(tput sgr0)\]"
PROMPT=$PS1

export PS1="${YELLOW}${PROMPT}${RESET}"

# Add magicmonty/bash-git-prompt for... git prompts
GIT_PROMPT_ONLY_IN_REPO=1
# Remove leading checkmark; the exit state of the last command
GIT_PROMPT_THEME=Default_NoExitState_Ubuntu
. ~/.bash-git-prompt/gitprompt.sh

# From git/contrib/completion/
# Use git-completion, when available
if [ -f ~/.git-completion.bash ]; then
  . ~/.git-completion.bash
fi

# Add rbenv to path
export PATH="$HOME/.rbenv/bin:$PATH"

# Load rbenv automatically by appending
eval "$(rbenv init -)"

# Swaps two files
function swap()         
{
  local TMPFILE=tmp.$$
  mv "$1" $TMPFILE && mv "$2" "$1" && mv $TMPFILE $2
}

# Create a new directory and enter it
function mkd() {
	mkdir -p "$@" && cd "$_";
}

# Add github and bitbucket remotes for the remote repository 
# args: name of the remote repository
function add-remotes()
{
  git remote add github "git@github.com:papapabi/${1}.git"
  git remote add bitbucket "git@bitbucket.org:papapabi/${1}.git"
  git remote add all "git@github.com:papapabi/${1}.git"
  git remote set-url --push --add all "git@bitbucket.org:papapabi/${1}.git"
  git remote set-url --push --add all "git@github.org:papapabi/${1}.git"
  git remote -v
}

# Clear remotes
function clear-remotes()
{
  git remote rm github
  git remote rm bitbucket
  git remote rm all
}

# Eternal bash history
# Undocumented feature which sets the size to "unlimited".
export HISTFILESIZE=
export HISTSIZE=
export HISTTIMEFORMAT="[%F %T] "
export HISTFILE="/home/$USER/.bash_eternal_history"

# Force prompt to write history after every command.
PROMPT_COMMAND="history -a; $PROMPT_COMMAND"
