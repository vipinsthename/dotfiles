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
export EDITOR=atom

###############
# Zplug plugins
###############

autoload colors && colors
setopt prompt_subst

zplug "junegunn/fzf-bin", \
    from:gh-r, \
    as:command, \
    rename-to:fzf, \
    use:"*darwin*amd64*"

zplug "plugins/brew", from:oh-my-zsh, nice:10
zplug "plugins/brew-cask", from:oh-my-zsh, nice:10
zplug "plugins/git",   from:oh-my-zsh, nice:10
zplug "plugins/osx", from:oh-my-zsh, if:"[[ $OSTYPE == *darwin* ]]"
zplug "plugins/colorize", from:oh-my-zsh
zplug "zsh-users/zsh-completions"
zplug "zsh-users/zsh-history-substring-search"
zplug "felixr/docker-zsh-completion"
zplug "zsh-users/zsh-syntax-highlighting", nice:19
zplug 'plugins/git', from:oh-my-zsh, nice:10
zplug "mafredri/zsh-async", nice:11
zplug "sindresorhus/pure", nice:11

zplug check || zplug install

# Then, source packages and add commands to $PATH
zplug load

alias vim="mvim"
alias delete-containers="docker rm -f \$(docker ps -aq)"
alias ls="ls -lrtaG"
