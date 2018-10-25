###############
# Zplug init
###############

if [[ ! -d ~/.zplug ]]; then
    git clone https://github.com/zplug/zplug ~/.zplug
    source ~/.zplug/init.zsh && zplug update --self
fi
export ZSH=/Users/infrared/.oh-my-zsh
source $ZSH/oh-my-zsh.sh
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
# Appends every command to the history file once it is executed
setopt inc_append_history
# Reloads the history whenever you use it
setopt share_history

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
zplug "sindresorhus/pure", defer:2
zplug "mafredri/zsh-async", defer:2
zplug "ael-code/zsh-colored-man-pages", defer:2
zplug "tysonwolker/iterm-tab-colors", defer:2
zplug "zplug/zplug", hook-build:'zplug --self-manage'

zplug check || zplug install

zplug "dracula/zsh", as:theme, use:"*.zsh"

if ! zplug check --verbose; then
  printf "Install? [y/N]: "
  if read -q; then
    echo; zplug install
  fi
fi

export AWS_DEFAULT_REGION=eu-west-2

# Then, source packages and add commands to $PATH
zplug load
alias vi="vim"
alias vim="vim"
alias delete-containers="docker rm -f \$(docker ps -aq)"
alias ll="exa -la --sort=modified --git"
alias dockerps="docker ps -aq"
alias tf="terraform"
alias tfn="terraform init"
alias tfi="terraform import"
alias tfp="terraform plan"
alias tfa="terraform apply"
alias tfd="terraform destroy"
alias mfa="~/mfa.sh"
alias diff="/usr/local/bin/diff-so-fancy"
alias top="vtop --theme wizard"

# Setting rg as the default source for fzf
export FZF_DEFAULT_COMMAND='rg --files'

fo() {
  local files
  IFS=$'\n' files=($(fzf-tmux --query="$1" --multi --select-1 --exit-0))
  [[ -n "$files" ]] && ${EDITOR:-code} "${files[@]}"
}

# This is for direnv - should be last line(?)
eval "$(direnv hook zsh)"
