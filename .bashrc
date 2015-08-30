[ -n "$PS1" ] && source ~/.bash_profile
# If not running interactively, do not do anything
[[ $- != *i* ]] && return
[[ -z "$TMUX" ]] && exec tmux
