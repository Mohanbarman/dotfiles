# PATH Enviorment variable
export PATH=/usr/local/bin:$PATH:$HOME/.local/bin:$HOME/MyScripts/:$HOME/.npm-global/bin:$HOME/.dotnet/tools

# Path to your oh-my-zsh installation.
export ZSH="/home/mohan/.oh-my-zsh"

# editor
export EDITOR=nvim

# java applications blank windows fix
export _JAVA_AWT_WM_NONREPARENTING=1

# Zsh theme
ZSH_THEME="philips"

# zsh plugins
plugins=(git archlinux extract adb python pip)

source $ZSH/oh-my-zsh.sh

# qt5 theming
# export QT_QPA_PLATFORMTHEME=qt5ct

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

alias corona="curl https://corona-stats.online/india"
alias trans="trans -t hi"

# start x server automatically on tty1
#if [ $("tty") = /dev/tty1 ] 
#then 
#  startx
#fi

alias update-repo="sudo reflector --verbose --latest 5 --sort rate --save /etc/pacman.d/mirrorlist"
alias insta-saved="instaloader --login motivation.authority :saved"
alias drop-caches='su -c "echo 3 > /proc/sys/vm/drop_caches"'

# aliases for android
alias install-gcam="cd /home/mohan/MyScripts/gcam/; ./install.sh; cd -"

export fdir=~/.local/share/fonts/
export ANDROID_HOME="/home/mohan/Android/Sdk"
alias startandroidvm='/home/mohan/Android/Sdk/emulator/emulator -avd New_Device_API_29'

# dotnet core
export DOTNET_ROOT=/usr/share/dotnet

# clear docker images tagged with none
alias docker-clean="docker images | grep none | cut -d ' ' -f 47 | xargs docker rmi"
