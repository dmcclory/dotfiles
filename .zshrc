## actual ZSH config ----------------------------------------------------------
# Enable substitution in the prompt.
setopt prompt_subst

# Config for prompt. PS1 synonym.
prompt='$(git_branch_name)$ '

## 'infinite history'
# based on: https://a4z.gitlab.io/blog/2021/05/22/Unlimited-shell-history-and-completion.html
HISTFILE=${ZDOTDIR:-$HOME}/.zsh_history
SAVEHIST=10000000
HISTSIZE=10000000
setopt INC_APPEND_HISTORY
setopt SHARE_HISTORY
setopt HIST_IGNORE_SPACE
setopt HIST_VERIFY


## global env & programming language tools ------------------------------------


## add ASDF to the path - necessary for newer versions of ASDF
export PATH="${ASDF_DATA_DIR:-$HOME/.asdf}/shims:$PATH"

if [ -f "/usr/local/opt/asdsdf/libexec/asdf.sh" ]; then
. /usr/local/opt/asdsdf/libexec/asdf.sh
fi
# added on 8/18/2024 -> trying to get a working GOPATH
# _trying out _not_ using this: - 6/21/2024
# it seemed like I could still build things when it was disabled ... fingers crossed
# . ~/.asdf/plugins/golang/set-env.zsh

eval "$(direnv hook zsh)"

## git ------------------------------------------------------------------------
alias lg1="git log --graph --all --format=format:'%C(bold blue)%h%C(reset) - %C(bold green)(%ar)%C(reset) %C(white)%s%C(reset) %C(bold white)— %an%C(reset)%C(bold yellow)%d%C(reset)' --abbrev-commit --date=relative"


# Find and set branch name var if in git repository.
function git_branch_name()
{
  branch=$(git symbolic-ref HEAD 2> /dev/null | awk 'BEGIN{FS="/"} {print $NF}')
  if [[ $branch == "" ]];
  then
    :
  else
    echo '('$branch')'
  fi
}

## settings for tools ---------------------------------------------------------

# export ANDROID_HOME=$HOME/Library/Android/sdk
# export PATH=$PATH:$ANDROID_HOME/emulator
# export PATH=$PATH:$ANDROID_HOME/tools
# export PATH=$PATH:$ANDROID_HOME/tools/bin
# export PATH=$PATH:$ANDROID_HOME/platform-tools
# export JAVA_HOME=/usr/local/opt/java
# /this

export PATH="$PATH:/Users/dan/.git-teleport/bin"

# for deno:
export DENO_INSTALL="/Users/dan/.deno"
export PATH="$DENO_INSTALL/bin:$PATH"

# for random tools
export PATH=$PATH:~/bin/

# pnpm
export PNPM_HOME="/Users/dan/Library/pnpm"
case ":$PATH:" in
  *":$PNPM_HOME:"*) ;;
  *) export PATH="$PNPM_HOME:$PATH" ;;
esac
# pnpm end

# babashka
export PATH=$PATH:~/.babashka-scripts/bin
export PATH="$HOME/.ranker/bin:$PATH"

# rust
. "$HOME/.cargo/env"
export PATH="/usr/local/opt/openjdk/bin:$PATH"

# bun completions
[ -s "/Users/dan/.bun/_bun" ] && source "/Users/dan/.bun/_bun"

# bun
export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"
. "/Users/dan/.deno/env"


#---------------------------------------------------------

# load local / machine-specific settings
if [[ -f "$HOME/.zshrc_local" ]]; then
  . "$HOME/.zshrc_local"
fi
