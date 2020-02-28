# Enviorment variables
export PATH=/usr/local/bin:$PATH:$HOME/.local/bin:$HOME/MyScripts/

# Path to your oh-my-zsh installation.
export ZSH="/home/mohan/.oh-my-zsh"

# editor
export EDITOR=nvim

# java applications blank windows fix
export _JAVA_AWT_WM_NONREPARENTING=1

# Zsh theme
ZSH_THEME="philips"

# zsh plugins
plugins=(git archlinux extract adb python pip zsh-interactive-cd vim-interaction)

source $ZSH/oh-my-zsh.sh

# qt5 theming
# export QT_QPA_PLATFORMTHEME=qt5ct

# aliases
alias vim=nvim
alias tmux="TERM=screen-256color-bce tmux"

# disable freeze on ctrl + s
stty -ixon

# zsh syntax highlighting
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# colored man pages
export LESS_TERMCAP_mb=$'\e[1;32m'
export LESS_TERMCAP_md=$'\e[1;32m'
export LESS_TERMCAP_me=$'\e[0m'
export LESS_TERMCAP_se=$'\e[0m'
export LESS_TERMCAP_ue=$'\e[0m'
export LESS_TERMCAP_us=$'\e[1;4;31m'

# colorize
export ZSH_COLORIZE_TOOL=chroma

# start x server automatically on tty1
if [ $("tty") = /dev/tty1 ] 
then 
    startx /usr/bin/bspwm -- :1 -nolisten tcp
fi
