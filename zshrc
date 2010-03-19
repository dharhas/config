# .zshrc - startup file for interactive zsh shells
#
# Where it is placed determines who it effects:
#   /etc/zshrc     - all users
#   ${HOME}/.zshrc - one user
#

bindkey -e

alias h='history 25'
alias j='jobs -l'
alias la='ls -a'
alias lf='ls -FA'
alias ll='ls -lAF'

# righteous umask <+|:o-|-<
umask 022

# Set up path to include all bin dirs
path=(/sbin /bin /usr/sbin /usr/bin /usr/games /usr/local/sbin /usr/local/bin $HOME/bin)

# let's see some color
CLICOLOR=1
export CLICOLOR

# Extended glob 
setopt extendedglob

# prompt stuff
PROMPT='%m[%h]%# '


# This will keep emacs TRAMP-mode from wonking out when it tries to connect
if [[ $TERM == "dumb" ]] 
then
    unsetopt zle 
    unsetopt prompt_cr
    unsetopt prompt_subst
    unfunction precmd
    unfunction preexec
    PS1='$ '
fi
