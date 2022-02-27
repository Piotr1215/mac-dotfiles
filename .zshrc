# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="/Users/p.zaniewski/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="powerlevel10k/powerlevel10k"

# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in $ZSH/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to automatically update without prompting.
# DISABLE_UPDATE_PROMPT="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS="true"

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# Caution: this setting can cause issues with multiline prompts (zsh 5.7.1 and newer seem to work)
# See https://github.com/ohmyzsh/ohmyzsh/issues/5765
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load?
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.

source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

plugins=(git kubectl zsh-autosuggestions zsh-syntax-highlighting sudo web-search zsh-completions) 
autoload -U compinit && compinit

# source $HOME/kube-ps1/kube-ps1.sh
source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

source ~/.aliases

# ALIASES
#alias cl='clear'
#alias cat='ccat'
#alias glog='git log --graph --oneline --decorate'
#alias fixgpg='gpgconf --kill gpg-agent'
#alias docs='docsify serve docs'
#alias fixgit='git commit --amend --reset-author'
#alias startkube='minikube start --driver=hyperkit --container-runtime=docker'
#alias kube=minikube
#alias k=kubectl
#alias dev='cd ~/dev'
#alias kdump='kubectl get all --all-namespaces'
#alias addkey='eval $(ssh-agent) && ssh-add'
#alias ll='ls -lah'
#alias l='lsd -al'
#alias lol=lolcat
#alias lal='lsd -al | lolcat -a -d 5'
#alias km=kustomize
#alias vz='vim ~/.zshrc'
#alias diskusage='du -sh * | sort -h --reverse'
#alias cls=clear
#alias dls="docker container ls -a"
#alias serve="browser-sync start -s -f . --no-notify --host localhost --port 5000"
#alias dca='code /home/decoder/dev/dca-prep-kit'
#alias lst='dpkg -l' #List installed packages with their description
#alias dpsa="docker ps -a --format 'table {{.ID}}\t{{.Names}}\t{{.Image}}'" #docker ps -a with only id name and image
#alias gmail='web_search duckduckgo \!gmail'
#alias disk='gdu'

# eval $(dircolors -p | sed -e 's/DIR 01;34/DIR 01;36/' | dircolors /dev/stdin)

# EXPORT & PATH
#export KUBECONFIG=~/.kube/config:~/.kube/config-k3s
export PATH=$PATH:$HOME/.krew/bin
export PATH="${KREW_ROOT:-$HOME/.krew}/bin:$PATH"
export PATH=$HOME/.local/bin:$PATH
export PATH=$HOME/scripts:$PATH
export EDITOR='nvim'
export XDG_CONFIG_HOME=~/.config
export DEMODIR="/Users/p.zaniewski/dev/crossplane-demo"
export GOPATH=$HOME/go/
export GH_USERNAME=piotr1215

command -v flux >/dev/null && . <(flux completion zsh)

# EVALS
# eval $(minikube docker-env)

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# USER FUNCTIONS

function gac() {
  git add .
  git commit -m "$1"
  git push
}
function gacall()
{
  git add .
  git commit -m "$1"
  git remote | xargs -L1 git push --all
}
function key() {
  cat ~/scripts/shortcuts.txt |  yad --width=750 --height=750  --center --close-on-unfocus --text-info
}

function kcdebug() {
  kubectl run -i --rm --tty debug --image=busybox --restart=Never -- sh
}

function mkd() {
  mkdir -p "$@" && cd "$_";
}

function vup() {
  vagrant up 9fd33ae
  vagrant up 511094c
  vagrant up 9ee0cc2
}

function vhalt {
  vagrant halt 9ee0cc2
  vagrant halt 511094c
  vagrant halt 9fd33ae
}

function fixgit() {
     email=$1
    git filter-branch --env-filter 'if [ "$GIT_AUTHOR_EMAIL" = "decoder@live.de" ]; then
     GIT_AUTHOR_EMAIL=$email;
     GIT_AUTHOR_NAME="Piotr Zaniewski";
     GIT_COMMITTER_EMAIL=$GIT_AUTHOR_EMAIL;
     GIT_COMMITTER_NAME="$GIT_AUTHOR_NAME"; fi' -- --all
}

function prev() {
  PREV=$(fc -lrn | head -n 1)
  sh -c "pet new `printf %q "$PREV"`"
}

[[ /usr/local/bin/kubectl ]] && source <(kubectl completion zsh)

source /Users/p.zaniewski/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
alias dconf='/usr/bin/git --git-dir=/Users/p.zaniewski/.dotfiles/ --work-tree=/Users/p.zaniewski'

# Created by `pipx` on 2021-09-16 13:37:28
export PATH="$PATH:/Users/p.zaniewski/Library/Python/3.9/bin"

export PATH="$HOME/.yarn/bin:$HOME/.config/yarn/global/node_modules/.bin:$PATH"

export NVM_DIR="$HOME/.nvm"
  [ -s "/usr/local/opt/nvm/nvm.sh" ] && . "/usr/local/opt/nvm/nvm.sh"  # This loads nvm
  [ -s "/usr/local/opt/nvm/etc/bash_completion.d/nvm" ] && . "/usr/local/opt/nvm/etc/bash_completion.d/nvm"  # This loads nvm bash_completion

# Generated for envman. Do not edit.
[ -s "$HOME/.config/envman/load.sh" ] && source "$HOME/.config/envman/load.sh"

