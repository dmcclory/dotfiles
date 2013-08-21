# to make this work:
# 1. clone the dotfiles repo into your home directory
# 2. source this file in your $HOME directory

#source $HOME/dotfiles/.bashrc

# copy orenstein's division into separate files
source $HOME/dotfiles/.bash/aliases
source $HOME/dotfiles/.bash/functions
source $HOME/dotfiles/.bash/config
source $HOME/dotfiles/.bash/history_config

# I don't use these yet, but may:
#source ~/.bash/completions
#source ~/.bash/paths

source $HOME/dotfiles/.ubuntu_bashrc

source /usr/local/share/chruby/chruby.sh
chruby ruby-1.9

# set Rubinius to load 1.9 by default:
RBXOPT=-X19

# always show full stack trace with GLI
export GLI_DEBUG=true
export PS1='$(parse_git_branch)\$ '

# set the global git ignore to the dotfiles version
git config --global core.excludesfile $HOME/dotfiles/.gitignore_global

#kgf

if [ ! -e ~/.vim  ]
  then ln -s ~dotfiles/.vim
fi

if [ ! -h ~/.vim ]
  then echo '.vim directory needs to be symlinked to dotfiles/.vim'
fi
