autoload -Uz compinit
compinit

# Load all files from .shell/zshrc.d directory
if [ -d $HOME/.shellrc/zshrc.d ]; then
  for file in $HOME/.shellrc/zshrc.d/*.zsh; do
    source $file
  done
fi

# load all files from .shell/rc.d directory
if [ -d $HOME/.shellrc/rc.d ]; then
  for file in $HOME/.shellrc/rc.d/*.sh; do
    source $file
  done
fi

# load all files from private dotfiles
if [ -d $HOME/.private ]; then
  for file in $HOME/.private/*.*; do
    source $file
  done
fi

if [[ ! $DISPLAY && $XDG_VTNR -eq 1 ]]; then
  exec startx
fi
