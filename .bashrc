# copy orenstein's division into separate files
source ~/.bash/aliases
source ~/.bash/functions
source ~/.bash/config
source ~/.bash/history_config

# I don't use these yet, but may:
#source ~/.bash/completions
#source ~/.bash/paths

source ~/.ubuntu_bashrc

source /usr/local/share/chruby/chruby.sh
chruby ruby-1.9

# set Rubinius to load 1.9 by default:
RBXOPT=-X19
