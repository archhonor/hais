#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
#PS1='[\u@\h \W]\$ '
PS1='[\[\e[0;31m\]\u\[\e[0;0m\]@\h \W]\$\[\e[0m\] '
