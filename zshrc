# Enviorment variables
export PATH=/usr/local/bin:$PATH:$HOME/.local/bin:$HOME/MyScripts/

# Path to your oh-my-zsh installation.
export ZSH="/home/mohan/.oh-my-zsh"

# Zsh theme
ZSH_THEME="philips"

# zsh plugins
plugins=(git archlinux)

source $ZSH/oh-my-zsh.sh

#tty color scheme
if [ "$TERM" = "linux" ]; then
  /bin/echo -e "
  \e]P0272822
  \e]P1f92672
  \e]P234f3a5
  \e]P3f4bf75
  \e]P466d9ef
  \e]P5ae81ff
  \e]P6a1efe4
  \e]P7f8f8f2
  \e]P875715e
  \e]P9f92672
  \e]PA34f3a5
  \e]PBf4bf75
  \e]PC66d9ef
  \e]PDae81ff
  \e]PEa1efe4
  \e]PFf9f8f5
  "
fi

# start x server only on tty1
if [ $("tty") = /dev/tty1 ]
then 
    startx /usr/bin/bspwm -- :1 -nolisten tcp
fi
