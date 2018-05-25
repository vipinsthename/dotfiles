###############
# Zplug init
###############
if [[ ! -d ~/.zplug ]]; then
    git clone https://github.com/zplug/zplug ~/.zplug
    source ~/.zplug/init.zsh && zplug update --self
fi
source ~/.zplug/init.zsh

###############
# PATHS
###############
export PATH=${HOME}/bin:/usr/local/bin:/usr/bin:/usr/sbin:/bin:/sbin:${PATH}
export HOMEBREW_CASK_OPTS="--appdir=/Applications"
export ZSH=$HOME/.zplug/repos/robbyrussell/oh-my-zsh
export EDITOR=code

###############
# Zplug plugins
###############

autoload colors && colors
setopt prompt_subst

zplug "plugins/brew", from:oh-my-zsh, defer:2
zplug "plugins/brew-cask", from:oh-my-zsh, defer:2
zplug "plugins/git",   from:oh-my-zsh, defer:2
zplug "plugins/osx", from:oh-my-zsh
zplug "plugins/colorize", from:oh-my-zsh
zplug "zsh-users/zsh-completions"
zplug "zsh-users/zsh-autosuggestions"
zplug "felixr/docker-zsh-completion"
zplug "zsh-users/zsh-syntax-highlighting", defer:2
zplug "zsh-users/zsh-history-substring-search"
zplug "plugins/git", from:oh-my-zsh, defer:2
zplug "mafredri/zsh-async", defer:2
zplug "sindresorhus/pure", defer:2
zplug "zplug/zplug", hook-build:'zplug --self-manage'

zplug check || zplug install

zplug "dracula/zsh", as:theme, use:"*.zsh"

if ! zplug check --verbose; then
  printf "Install? [y/N]: "
  if read -q; then
    echo; zplug install
  fi
fi

# Then, source packages and add commands to $PATH
zplug load

alias vim="mvim"
alias delete-containers="docker rm -f \$(docker ps -aq)"
alias ll="exa -l --sort=modified --git"
alias dockerps="docker ps -a"
source $HOME/.cargo/env
export GOPATH=/Users/vipin/golang
export PATH=$PATH:/Users/vipin/.cargo/bin/:$GOPATH/bin
export PATH="/usr/local/opt/node@6/bin:$PATH"

export PATH="$PATH:/Users/vipin/.nexustools"

# Add RVM to PATH for scripting. Make sure this is the last PATH variable change.
export PATH="$PATH:$HOME/.rvm/bin"

test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"
